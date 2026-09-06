(function (root, factory) {
    const api = factory();
    if (typeof module === 'object' && module.exports) module.exports = api;
    if (root) root.MechanicSchemaForm = api;
}(typeof globalThis !== 'undefined' ? globalThis : this, function () {
    'use strict';

    function isObject(value) {
        return value !== null && typeof value === 'object' && !Array.isArray(value);
    }

    function resolvePointer(document, reference) {
        if (typeof reference !== 'string' || !reference.startsWith('#/')) return null;
        let value = document;
        for (const encodedPart of reference.slice(2).split('/')) {
            const part = encodedPart.replace(/~1/g, '/').replace(/~0/g, '~');
            if (!isObject(value) || !Object.prototype.hasOwnProperty.call(value, part)) return null;
            value = value[part];
        }
        return isObject(value) ? value : null;
    }

    function resolveSchema(schema, document) {
        let current = isObject(schema) ? schema : {};
        const seen = new Set();
        while (typeof current.$ref === 'string' && !seen.has(current.$ref)) {
            seen.add(current.$ref);
            const resolved = resolvePointer(document || schema, current.$ref);
            if (!resolved) break;
            current = { ...resolved, ...current };
            delete current.$ref;
        }
        return current;
    }

    function schemaInfo(schema, document) {
        const resolved = resolveSchema(schema, document);
        const alternatives = Array.isArray(resolved.anyOf)
            ? resolved.anyOf.map(item => resolveSchema(item, document))
            : [];
        const nullable = alternatives.some(item => item.type === 'null');
        const concrete = alternatives.find(item => item.type !== 'null') || resolved;
        const merged = concrete === resolved ? resolved : { ...resolved, ...concrete };
        delete merged.anyOf;
        return { schema: merged, nullable };
    }

    function valueType(schema) {
        if (Array.isArray(schema.enum) && schema.enum.length) {
            const first = schema.enum.find(value => value !== null);
            if (first !== undefined) return typeof first;
        }
        if (schema.type) return schema.type;
        if (schema.properties) return 'object';
        return 'string';
    }

    function initialInput(schema, context) {
        const document = isObject(schema) ? schema : {};
        const rootSchema = schemaInfo(document, document).schema;
        const properties = isObject(rootSchema.properties) ? rootSchema.properties : {};
        const required = new Set(Array.isArray(rootSchema.required) ? rootSchema.required : []);
        const input = {};
        for (const [name, rawProperty] of Object.entries(properties)) {
            const property = schemaInfo(rawProperty, document).schema;
            if (context && Object.prototype.hasOwnProperty.call(context, name) && context[name] !== '') {
                input[name] = context[name];
            } else if (Object.prototype.hasOwnProperty.call(property, 'default') &&
                       (property.default !== null || required.has(name))) {
                input[name] = property.default;
            }
        }
        return input;
    }

    function validateValue(value, rawSchema, document, path) {
        const info = schemaInfo(rawSchema, document);
        const schema = info.schema;
        const label = path || 'value';
        if (value === null) return info.nullable || schema.type === 'null' ? [] : [`${label} cannot be null`];

        const type = valueType(schema);
        if (type === 'object') {
            if (!isObject(value)) return [`${label} must be a JSON object`];
            const errors = [];
            const properties = isObject(schema.properties) ? schema.properties : {};
            const required = new Set(Array.isArray(schema.required) ? schema.required : []);
            for (const name of required) {
                if (!Object.prototype.hasOwnProperty.call(value, name)) errors.push(`${label}.${name} is required`);
            }
            for (const [name, child] of Object.entries(properties)) {
                if (Object.prototype.hasOwnProperty.call(value, name)) {
                    errors.push(...validateValue(value[name], child, document, `${label}.${name}`));
                }
            }
            return errors;
        }
        if (type === 'array') {
            if (!Array.isArray(value)) return [`${label} must be a JSON array`];
            const errors = [];
            if (Number.isInteger(schema.minItems) && value.length < schema.minItems) errors.push(`${label} needs at least ${schema.minItems} items`);
            if (Number.isInteger(schema.maxItems) && value.length > schema.maxItems) errors.push(`${label} allows at most ${schema.maxItems} items`);
            if (schema.items) value.forEach((item, index) => errors.push(...validateValue(item, schema.items, document, `${label}[${index}]`)));
            return errors;
        }
        if (type === 'boolean' && typeof value !== 'boolean') return [`${label} must be true or false`];
        if ((type === 'number' || type === 'integer') && (typeof value !== 'number' || !Number.isFinite(value))) return [`${label} must be a number`];
        if (type === 'integer' && !Number.isInteger(value)) return [`${label} must be an integer`];
        if (type === 'string' && typeof value !== 'string') return [`${label} must be text`];

        const errors = [];
        if (Array.isArray(schema.enum) && !schema.enum.some(item => Object.is(item, value))) errors.push(`${label} must be one of the listed values`);
        if (typeof value === 'string') {
            if (Number.isInteger(schema.minLength) && value.length < schema.minLength) errors.push(`${label} must contain at least ${schema.minLength} characters`);
            if (Number.isInteger(schema.maxLength) && value.length > schema.maxLength) errors.push(`${label} must contain at most ${schema.maxLength} characters`);
            if (schema.pattern) {
                try {
                    if (!(new RegExp(schema.pattern)).test(value)) errors.push(`${label} has an invalid format`);
                } catch (error) {}
            }
        }
        if (typeof value === 'number') {
            if (typeof schema.minimum === 'number' && value < schema.minimum) errors.push(`${label} must be at least ${schema.minimum}`);
            if (typeof schema.maximum === 'number' && value > schema.maximum) errors.push(`${label} must be at most ${schema.maximum}`);
        }
        return errors;
    }

    function parseRawValue(raw, rawSchema, document, path) {
        const info = schemaInfo(rawSchema, document);
        const schema = info.schema;
        if (info.nullable && raw.trim() === 'null') return { value: null, errors: [] };
        const type = valueType(schema);
        if (type === 'object' || type === 'array') {
            try {
                const value = JSON.parse(raw);
                return { value, errors: validateValue(value, rawSchema, document, path) };
            } catch (error) {
                return { errors: [`${path} must contain valid JSON: ${error.message}`] };
            }
        }
        if (type === 'boolean') {
            if (raw === 'true') return { value: true, errors: [] };
            if (raw === 'false') return { value: false, errors: [] };
            return { errors: [`${path} must be true or false`] };
        }
        if (type === 'number' || type === 'integer') {
            const value = Number(raw);
            if (raw.trim() === '' || !Number.isFinite(value)) return { errors: [`${path} must be a number`] };
            return { value, errors: validateValue(value, rawSchema, document, path) };
        }
        return { value: raw, errors: validateValue(raw, rawSchema, document, path) };
    }

    function appendTextElement(document, parent, tagName, className, text) {
        const element = document.createElement(tagName);
        if (className) element.className = className;
        element.textContent = text;
        parent.appendChild(element);
        return element;
    }

    function createSchemaForm(container, schema, options) {
        const document = container.ownerDocument || globalThis.document;
        const rootSchema = isObject(schema) ? schema : {};
        const objectSchema = schemaInfo(rootSchema, rootSchema).schema;
        const properties = isObject(objectSchema.properties) ? objectSchema.properties : {};
        const required = new Set(Array.isArray(objectSchema.required) ? objectSchema.required : []);
        const initial = initialInput(rootSchema, options && options.context);
        const controls = new Map();
        container.replaceChildren();

        if (Object.keys(properties).length === 0) {
            appendTextElement(document, container, 'div', 'schema-empty', 'This command takes no input.');
        }

        for (const [name, rawProperty] of Object.entries(properties)) {
            const propertyInfo = schemaInfo(rawProperty, rootSchema);
            const property = propertyInfo.schema;
            const type = valueType(property);
            const field = document.createElement('div');
            field.className = 'schema-field';
            const label = appendTextElement(document, field, 'label', 'schema-label', name);
            if (required.has(name)) appendTextElement(document, label, 'span', 'schema-required', ' required');
            if (property.description) appendTextElement(document, field, 'div', 'schema-description', property.description);

            let control;
            if (Array.isArray(property.enum)) {
                control = document.createElement('select');
                const blank = document.createElement('option');
                blank.value = '';
                blank.textContent = required.has(name) ? 'Select…' : 'Not set';
                control.appendChild(blank);
                for (const enumValue of property.enum) {
                    if (enumValue === null && !propertyInfo.nullable) continue;
                    const option = document.createElement('option');
                    option.value = JSON.stringify(enumValue);
                    option.textContent = String(enumValue);
                    control.appendChild(option);
                }
                control.dataset.schemaKind = 'enum';
            } else if (type === 'boolean') {
                control = document.createElement('select');
                const blank = document.createElement('option');
                blank.value = '';
                blank.textContent = required.has(name) ? 'Select…' : 'Not set';
                control.appendChild(blank);
                for (const value of [true, false]) {
                    const option = document.createElement('option');
                    option.value = String(value);
                    option.textContent = String(value);
                    control.appendChild(option);
                }
                if (propertyInfo.nullable) {
                    const option = document.createElement('option');
                    option.value = 'null';
                    option.textContent = 'null';
                    control.appendChild(option);
                }
            } else if (type === 'object' || type === 'array') {
                control = document.createElement('textarea');
                control.rows = type === 'object' ? 5 : 3;
                control.spellcheck = false;
                control.placeholder = type === 'object' ? '{ }' : '[ ]';
            } else {
                control = document.createElement('input');
                control.type = type === 'number' || type === 'integer' ? 'number' : 'text';
                if (type === 'integer') control.step = '1';
                if (typeof property.minimum === 'number') control.min = String(property.minimum);
                if (typeof property.maximum === 'number') control.max = String(property.maximum);
                if (Number.isInteger(property.minLength)) control.minLength = property.minLength;
                if (Number.isInteger(property.maxLength)) control.maxLength = property.maxLength;
                if (property.pattern) control.pattern = property.pattern;
            }
            control.className = 'schema-control';
            control.id = `schema-field-${controls.size}`;
            label.htmlFor = control.id;
            field.appendChild(control);
            container.appendChild(field);
            controls.set(name, {
                control,
                schema: rawProperty,
                required: required.has(name),
                nullable: propertyInfo.nullable,
                kind: control.dataset.schemaKind || type,
            });
        }

        function setValue(value) {
            const source = isObject(value) ? value : {};
            for (const [name, config] of controls) {
                const hasValue = Object.prototype.hasOwnProperty.call(source, name);
                const current = hasValue ? source[name] : '';
                if (config.kind === 'object' || config.kind === 'array') {
                    config.control.value = hasValue ? JSON.stringify(current, null, 2) : '';
                } else if (config.kind === 'enum') {
                    config.control.value = hasValue ? JSON.stringify(current) : '';
                } else if (current === null && config.nullable) {
                    config.control.value = 'null';
                } else {
                    config.control.value = hasValue ? String(current) : '';
                }
            }
        }

        function getValue() {
            const value = {};
            const errors = [];
            for (const [name, config] of controls) {
                const raw = String(config.control.value || '');
                if (raw.trim() === '') {
                    if (config.required) errors.push(`${name} is required`);
                    continue;
                }
                if (config.kind === 'enum') {
                    try {
                        value[name] = JSON.parse(raw);
                    } catch (error) {
                        errors.push(`${name} has an invalid selection`);
                    }
                    continue;
                }
                const parsed = parseRawValue(raw, config.schema, rootSchema, name);
                if (parsed.errors.length) errors.push(...parsed.errors);
                else value[name] = parsed.value;
            }
            return { value, errors };
        }

        setValue(initial);
        return { getValue, setValue, initialValue: initial, controls };
    }

    function supportsSchemaForm(schema) {
        if (!isObject(schema) || Array.isArray(schema.oneOf) || Array.isArray(schema.allOf)) return false;
        const root = schemaInfo(schema, schema).schema;
        return valueType(root) === 'object' && isObject(root.properties || {});
    }

    return {
        createSchemaForm,
        initialInput,
        parseRawValue,
        resolveSchema,
        schemaInfo,
        supportsSchemaForm,
        validateValue,
    };
}));
