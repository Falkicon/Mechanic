const assert = require('node:assert/strict');
const { createDashboard, MechanicSchemaForm } = require('./dashboard_regressions.cjs');

const targetSchema = {
  default: null,
  anyOf: [
    { type: 'null' },
    { $ref: '#/$defs/DiagnosticTarget' },
  ],
};
const commandSchema = {
  type: 'object',
  required: ['version'],
  properties: {
    version: { type: 'string', minLength: 2, description: 'Release version supplied by the user.' },
    dry_run: { type: 'boolean', default: false, description: 'Preview without writing.' },
    mode: { type: 'string', enum: ['safe', 'fast'], default: 'safe' },
    retries: { type: 'integer', minimum: 1, maximum: 3 },
    target: targetSchema,
    addon: { type: 'string' },
    'future-field"><script>': { type: 'string', description: '<b>schema text</b>' },
  },
  $defs: {
    DiagnosticTarget: {
      type: 'object',
      properties: {
        client: { type: 'string', description: 'Absolute client path.' },
        account: { type: 'string' },
        character: { type: 'string' },
        profile: { type: 'string' },
      },
      additionalProperties: false,
    },
  },
};

{
  const target = {
    client: 'C:/Games/World of Warcraft/_retail_',
    account: 'ACCOUNT',
    character: 'Ada - Realm',
    profile: 'Ada',
  };
  const input = MechanicSchemaForm.initialInput(commandSchema, {
    addon: 'Weekly',
    path: 'C:/ignored-because-schema-has-no-path',
    target,
  });
  assert.deepEqual(input, { dry_run: false, mode: 'safe', target, addon: 'Weekly' });
  assert.equal(Object.hasOwn(input, 'version'), false, 'required values must start blank without a schema default');
  assert.equal(Object.hasOwn(input, 'path'), false, 'context is injected only for declared properties');
  const withoutContext = MechanicSchemaForm.initialInput(commandSchema, {});
  assert.equal(Object.hasOwn(withoutContext, 'target'), false, 'nullable optional defaults stay omitted');

  assert.deepEqual(
    MechanicSchemaForm.validateValue({ version: '1.2', target }, commandSchema, commandSchema, 'input'),
    [],
  );
  assert.match(
    MechanicSchemaForm.validateValue({ version: 'x', retries: 5 }, commandSchema, commandSchema, 'input').join('\n'),
    /at least 2 characters|at most 3/,
  );
  assert.match(
    MechanicSchemaForm.parseRawValue('{broken', targetSchema, commandSchema, 'target').errors[0],
    /valid JSON/,
  );
}

{
  const dashboard = createDashboard();
  dashboard.installCommandCatalog([
    {
      name: 'diagnostic.metrics',
      description: 'Collect metrics for one explicit target.',
      input_schema: commandSchema,
      output_schema: { type: 'object' },
      mutation: false,
    },
    {
      name: 'release.future',
      description: 'A future command discovered only from the server catalog.',
      input_schema: { type: 'object', properties: { dry_run: { type: 'boolean', default: true } } },
      output_schema: { type: 'object' },
      mutation: true,
    },
    {
      name: 'extension.raw-only',
      description: 'Uses a schema construct outside the compact form renderer.',
      input_schema: { oneOf: [{ type: 'object' }, { type: 'string' }] },
      output_schema: {},
      mutation: false,
    },
  ]);

  const picker = dashboard.elements.get('command-picker');
  assert.deepEqual(picker.children.map(option => option.value), ['', 'diagnostic.metrics', 'extension.raw-only', 'release.future']);
  assert.match(picker.children[3].textContent, /changes state/);

  dashboard.navigateToCommand('diagnostic.metrics');
  const form = dashboard.elements.get('cmd-schema-form');
  assert.equal(form.children.length, Object.keys(commandSchema.properties).length);
  const generatedField = form.children.find(field => field.children[0]?.textContent === 'future-field"><script>');
  assert.ok(generatedField, 'a property added by the backend schema should become a form field');
  assert.equal(generatedField.children[1].textContent, '<b>schema text</b>', 'schema text stays text, not markup');

  const rawInput = dashboard.elements.get('cmd-raw-input');
  const initial = JSON.parse(rawInput.value);
  assert.deepEqual(initial, { dry_run: false, mode: 'safe' });
  assert.equal(Object.hasOwn(initial, 'version'), false);

  const blank = dashboard.getCurrentCommandInput();
  assert.match(blank.errors.join('\n'), /version is required/);

  dashboard.setCommandInputMode('raw');
  rawInput.value = '{malformed';
  assert.match(dashboard.getCurrentCommandInput().errors[0], /valid JSON/);

  rawInput.value = JSON.stringify({ version: '1.2', retries: 0 });
  assert.match(dashboard.getCurrentCommandInput().errors.join('\n'), /at least 1/);

  rawInput.value = JSON.stringify({
    version: '1.2',
    target: {
      client: 'C:/Games/World of Warcraft/_retail_',
      account: 'ACCOUNT',
      character: 'Ada - Realm',
      profile: 'Ada',
    },
  });
  assert.deepEqual(dashboard.getCurrentCommandInput().errors, []);

  dashboard.navigateToCommand('extension.raw-only');
  assert.equal(dashboard.elements.get('cmd-schema-form').children.length, 0);
  rawInput.value = JSON.stringify({ extension_specific: ['value'] });
  assert.equal(
    JSON.stringify(dashboard.getCurrentCommandInput()),
    JSON.stringify({ value: { extension_specific: ['value'] }, errors: [] }),
  );
}

async function testSafeInitialization() {
  const requests = [];
  const dashboard = createDashboard({
    activeView: 'libraries',
    fetchImpl: async (url, options = {}) => {
      requests.push({ url, options });
      const body = options.body ? JSON.parse(options.body) : null;
      if (body?.command === 'commands.list') {
        return { json: async () => ({ success: true, data: { commands: [] } }) };
      }
      if (body?.command === 'diagnostic.targets') {
        return { json: async () => ({ success: true, data: { targets: [] } }) };
      }
      return { json: async () => ({ history: [] }) };
    },
  });
  await dashboard.init();
  const invokedCommands = requests
    .filter(request => request.options.method === 'POST')
    .map(request => JSON.parse(request.options.body).command)
    .sort();
  assert.deepEqual(invokedCommands, ['commands.list', 'diagnostic.targets']);
}

async function testTargetIsolation() {
  const pending = [];
  const dashboard = createDashboard({
    fetchImpl: (url, options) => new Promise(resolve => {
      pending.push({ resolve, body: JSON.parse(options.body) });
    }),
  });
  const targets = [
    { client: 'C:/WoW/_retail_', account: 'A', character: 'Ada - Realm', profile: 'Ada' },
    { client: 'D:/WoW/_ptr_', account: 'B', character: 'Bob - Realm', profile: 'Bob' },
  ];
  dashboard.installDiagnosticTargets(targets);
  const selector = dashboard.elements.get('diagnostic-target');

  selector.value = '0';
  selector.onchange();
  selector.value = '1';
  selector.onchange();
  assert.equal(pending.length, 2);
  assert.deepEqual(pending[0].body.input.target, targets[0]);
  assert.deepEqual(pending[1].body.input.target, targets[1]);

  pending[0].resolve({ json: async () => ({ success: true, data: { error_count: 99 } }) });
  await new Promise(resolve => setImmediate(resolve));
  assert.equal(dashboard.elements.get('output-error-count').textContent, '0', 'stale target output must be ignored');

  pending[1].resolve({ json: async () => ({ success: true, data: { error_count: 2 } }) });
  await new Promise(resolve => setImmediate(resolve));
  assert.equal(dashboard.elements.get('output-error-count').textContent, 2);

  dashboard.updateTestResults({ data: { target: targets[0] } });
  assert.equal(pending.length, 2, 'a broadcast for another target must be ignored');
  dashboard.updateTestResults({ candidates: targets });
  assert.equal(pending.length, 3, 'an ambiguous invalidation should refetch the selected target');
}

Promise.all([testSafeInitialization(), testTargetIsolation()])
  .then(() => console.log('dashboard schema regressions passed'))
  .catch(error => {
    console.error(error);
    process.exitCode = 1;
  });
