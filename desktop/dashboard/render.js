(function (root, factory) {
    const api = factory();
    if (typeof module === 'object' && module.exports) module.exports = api;
    if (root) root.MechanicRender = api;
}(typeof globalThis !== 'undefined' ? globalThis : this, function () {
    'use strict';

    // Pure HTML-string renderers for addon output. Every value that comes from
    // commands, SavedVariables or addon output passes through escapeHtml, including
    // numbers, so a hostile addon cannot inject markup.

    const MAX_ERRORS_PER_ADDON = 10;
    const MAX_CONSOLE_ENTRIES = 50;

    function escapeHtml(value) {
        return String(value ?? '').replace(/[&<>"']/g, char => ({
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#39;'
        })[char]);
    }

    function isObject(value) {
        return value !== null && typeof value === 'object' && !Array.isArray(value);
    }

    function toCount(value) {
        const number = Number(value);
        return Number.isFinite(number) && number >= 1 ? Math.floor(number) : 1;
    }

    function toNumber(value) {
        const number = Number(value);
        return Number.isFinite(number) ? number : 0;
    }

    function emptyNote(message) {
        return `<div class="empty-note">${escapeHtml(message)}</div>`;
    }

    function disclosure(className, attribute, targetId, inner, expanded) {
        const id = escapeHtml(targetId);
        return `<button type="button" class="toggle-btn ${className}" ${attribute}="${id}" aria-expanded="${expanded ? 'true' : 'false'}" aria-controls="${id}">${inner}</button>`;
    }

    function extractErrorMessage(message) {
        if (!message) return '';
        const text = String(message);
        const parts = text.split(':');
        if (parts.length > 3) return parts.slice(3).join(':').trim().substring(0, 80);
        return text.substring(0, 80);
    }

    function renderLibraryTags(libraries) {
        if (!Array.isArray(libraries) || libraries.length === 0) return '';
        const highlights = ['FenUI', 'MechanicLib', 'AceAddon-3.0'];
        return libraries.filter(isObject).map(lib => {
            const name = String(lib.name || 'Unknown');
            const isHighlight = highlights.some(h => name.includes(h));
            const cls = isHighlight ? 'lib-badge-small highlight' : 'lib-badge-small';
            return `<div class="${cls}" title="${escapeHtml(name)}">${escapeHtml(name)} ${escapeHtml(lib.version)}</div>`;
        }).join('');
    }

    function renderErrorTree(errors) {
        const byAddon = new Map();
        for (const err of Array.isArray(errors) ? errors : []) {
            if (!isObject(err)) continue;
            const addon = String(err.addon || 'Unknown');
            if (!byAddon.has(addon)) byAddon.set(addon, []);
            byAddon.get(addon).push(err);
        }
        if (byAddon.size === 0) return emptyNote('No errors. Do /reload in-game to capture data.');

        let html = '';
        const sortedAddons = [...byAddon.keys()].sort();
        sortedAddons.forEach((addon, addonIndex) => {
            const addonErrors = byAddon.get(addon);
            const itemsId = `addon-errors-${addonIndex}`;
            const count = addonErrors.reduce((sum, e) => sum + toCount(e.counter), 0);

            html += '<div class="error-addon">';
            html += disclosure('error-addon-header', 'data-toggle', itemsId,
                `<span class="error-addon-name"><span class="chevron" aria-hidden="true">▶</span> ${escapeHtml(addon)}</span>` +
                `<span class="error-addon-count">${escapeHtml(count)}</span>`);
            html += `<div id="${itemsId}" class="error-addon-items">`;

            addonErrors.slice(0, MAX_ERRORS_PER_ADDON).forEach((err, i) => {
                const location = `${err.file || 'unknown'}:${err.line || 0}`;
                const counter = toCount(err.counter);
                const countStr = counter > 1 ? `<span class="error-count">×${escapeHtml(counter)}</span>` : '';
                const detailId = `err-${addonIndex}-${i}`;
                html += disclosure('error-item', 'data-toggle', detailId,
                    `<span class="error-location">${escapeHtml(location)}</span>${countStr}` +
                    `<span class="error-message">${escapeHtml(extractErrorMessage(err.message))}</span>`);
                html += `<div id="${detailId}" class="error-detail">${escapeHtml(err.stack || err.message || 'No details')}</div>`;
            });

            if (addonErrors.length > MAX_ERRORS_PER_ADDON) {
                html += `<div class="error-more">... and ${escapeHtml(addonErrors.length - MAX_ERRORS_PER_ADDON)} more</div>`;
            }
            html += '</div></div>';
        });
        return html;
    }

    function renderDetailItem(detail) {
        if (typeof detail === 'string') return `<div class="test-detail-item"><span>•</span> ${escapeHtml(detail)}</div>`;
        if (isObject(detail)) {
            const label = detail.label || detail.msg || detail.text || '';
            const value = detail.value !== undefined
                ? `: <span class="test-detail-value">${escapeHtml(detail.value)}</span>`
                : '';
            const status = detail.status ? ` <span class="test-detail-status">(${escapeHtml(detail.status)})</span>` : '';
            if (label || value) {
                return `<div class="test-detail-item"><span>•</span> ${escapeHtml(label)}${value}${status}</div>`;
            }
            return `<div class="test-detail-item"><span>•</span> ${escapeHtml(JSON.stringify(detail))}</div>`;
        }
        return `<div class="test-detail-item"><span>•</span> ${escapeHtml(detail)}</div>`;
    }

    function renderTestRow(test, testId) {
        const duration = test.duration ? `${(toNumber(test.duration) * 1000).toFixed(1)}ms` : '';
        const details = isObject(test.details) ? Object.values(test.details) : [];
        const logs = Array.isArray(test.logs) ? test.logs : [];
        const hasDetails = Boolean(test.message) || details.length > 0 || logs.length > 0;
        const statusClass = test.passed ? 'pass' : 'fail';
        const info = `<span class="test-info"><span class="test-status-bullet ${statusClass}"></span>` +
            `<span class="test-name">${escapeHtml(test.name || 'unnamed')}</span>` +
            `<span class="test-meta">${escapeHtml(duration)}</span></span>`;

        if (!hasDetails) return `<div class="test-row no-click">${info}</div>`;

        let pane = '';
        if (test.message) pane += `<div class="test-msg">${escapeHtml(test.message)}</div>`;
        if (details.length > 0) {
            pane += '<span class="test-label-small">Steps / Details</span>';
            pane += details.map(renderDetailItem).join('');
        }
        if (logs.length > 0) {
            pane += '<span class="test-label-small test-label-logs">Captured Logs</span>';
            pane += `<div class="test-captured-logs">${escapeHtml(logs.join('\n'))}</div>`;
        }
        return disclosure('test-row', 'data-toggle', testId, `${info}<span class="test-chevron" aria-hidden="true">▶</span>`) +
            `<div id="${testId}" class="test-details-pane">${pane}</div>`;
    }

    function renderPerf(perf, perfId) {
        if (perf.length === 0) return '';
        const rows = perf.filter(isObject).map(p =>
            '<div class="test-detail-item perf-item">' +
            `<div><span>⚡</span> ${escapeHtml(p.name)} <span class="perf-description">(${escapeHtml(p.description)})</span></div>` +
            `<div class="perf-value">${escapeHtml(p.ms != null ? p.ms : '')}${p.percent != null ? ` (${escapeHtml(p.percent)}%)` : ''}</div>` +
            '</div>').join('');
        return disclosure('test-addon-perf-row', 'data-toggle', perfId,
            '<span class="perf-title"><span>🛡️</span> SYSTEM HEALTH</span>' +
            `<span class="perf-meta"><span class="perf-count">${escapeHtml(perf.length)} Metrics</span><span class="test-chevron-perf" aria-hidden="true">▶</span></span>`) +
            `<div id="${perfId}" class="test-details-pane-perf">${rows}</div>`;
    }

    function renderTestBadges(tests, perfData) {
        const grouped = new Map();
        for (const test of Array.isArray(tests) ? tests : []) {
            if (!isObject(test)) continue;
            const addon = String(test.addon || '!Mechanic');
            const category = String(test.category || 'General');
            if (!grouped.has(addon)) grouped.set(addon, new Map());
            const categories = grouped.get(addon);
            if (!categories.has(category)) categories.set(category, []);
            categories.get(category).push(test);
        }

        let html = '';
        [...grouped.keys()].sort().forEach((addon, addonIndex) => {
            const categories = grouped.get(addon);
            let total = 0;
            let passed = 0;
            for (const list of categories.values()) {
                total += list.length;
                passed += list.filter(t => t.passed).length;
            }
            const hasPerf = isObject(perfData) && Object.prototype.hasOwnProperty.call(perfData, addon) &&
                Array.isArray(perfData[addon]);
            const perf = hasPerf ? perfData[addon] : [];
            const bodyId = `output-section-tests-${addonIndex}-body`;

            html += '<div class="output-section">';
            html += disclosure('output-section-header', 'data-collapse', bodyId,
                `<span class="output-section-title">✅ TESTS: ${escapeHtml(addon)}` +
                `<span class="output-section-count">${escapeHtml(passed)}/${escapeHtml(total)} Passed</span></span>` +
                '<span class="output-section-meta" aria-hidden="true">▼</span>', true);
            html += `<div id="${bodyId}" class="output-section-body"><div class="test-tree">`;
            html += renderPerf(perf, `perf-${addonIndex}`);

            [...categories.keys()].sort().forEach((category, categoryIndex) => {
                html += `<div class="test-category"><div class="test-category-header">${escapeHtml(category)}</div>`;
                categories.get(category).forEach((test, i) => {
                    html += renderTestRow(test, `test-${addonIndex}-${categoryIndex}-${i}`);
                });
                html += '</div>';
            });
            html += '</div></div></div>';
        });
        return html;
    }

    function renderConsoleLog(entries, filter) {
        if (!Array.isArray(entries) || entries.length === 0) {
            return emptyNote('No console entries. Do /reload in-game to capture logs.');
        }
        const active = filter || 'all';
        const filtered = entries.filter(isObject).filter(
            e => active === 'all' || e.category === active || e.source === active);

        // Collapse consecutive duplicates of the most recent entries.
        const deduped = [];
        let currentKey = null;
        let currentEntry = null;
        let count = 0;
        for (const entry of filtered.slice(-MAX_CONSOLE_ENTRIES)) {
            const key = `${entry.source}|${entry.category}|${entry.message}`;
            if (currentKey === null) {
                currentKey = key;
                currentEntry = entry;
                count = 1;
            } else if (key === currentKey) {
                count++;
            } else {
                deduped.push({ entry: currentEntry, count });
                currentKey = key;
                currentEntry = entry;
                count = 1;
            }
        }
        if (currentEntry) deduped.push({ entry: currentEntry, count });

        return deduped.map(({ entry, count: repeats }) => {
            const source = entry.source || 'System';
            const category = entry.category ? `[${entry.category}]` : '';
            const repeat = repeats > 1 ? ` <span class="console-repeat">(x${escapeHtml(repeats)})</span>` : '';
            return '<div class="console-entry">' +
                `<span class="console-source">[${escapeHtml(source)}]</span>` +
                `<span class="console-category">${escapeHtml(category)}</span>` +
                `<span class="console-message">${escapeHtml(entry.message || '')}${repeat}</span></div>`;
        }).join('');
    }

    function renderSandboxResults(data) {
        const source = isObject(data) ? data : {};
        const tests = Array.isArray(source.tests) ? source.tests.filter(isObject) : [];
        if (tests.length === 0) return emptyNote('No tests found for this addon.');

        // Group tests by describe block (part before " > ").
        const groups = new Map();
        for (const test of tests) {
            const name = String(test.name ?? 'unnamed');
            const parts = name.split(' > ');
            const group = parts.length > 1 ? parts[0] : 'Tests';
            if (!groups.has(group)) groups.set(group, []);
            groups.get(group).push({ test, shortName: parts.length > 1 ? parts.slice(1).join(' > ') : name });
        }

        let html = '';
        for (const [groupName, items] of groups) {
            const passed = items.filter(item => item.test.passed).length;
            html += '<div class="sandbox-group">' +
                '<div class="sandbox-group-header">' +
                `<span class="test-status-bullet ${passed === items.length ? 'pass' : 'fail'}"></span>` +
                `<span class="sandbox-group-name">${escapeHtml(groupName)}</span>` +
                `<span class="sandbox-group-count">${escapeHtml(passed)}/${escapeHtml(items.length)}</span></div>` +
                '<div class="sandbox-group-items">';
            for (const { test, shortName } of items) {
                const duration = test.duration
                    ? `<span class="sandbox-duration">${escapeHtml(toNumber(test.duration).toFixed(1))}ms</span>`
                    : '';
                const error = !test.passed && test.error
                    ? `<div class="sandbox-error">${escapeHtml(test.error)}</div>`
                    : '';
                html += '<div class="test-row no-click sandbox-test">' +
                    '<span class="test-info">' +
                    `<span class="test-status-bullet ${test.passed ? 'pass' : 'fail'}"></span>` +
                    `<span class="test-name ${test.passed ? 'test-name-pass' : ''}">${escapeHtml(shortName)}</span>` +
                    `${duration}</span>${error}</div>`;
            }
            html += '</div></div>';
        }

        const sourceFiles = Array.isArray(source.source_files) && source.source_files.length
            ? escapeHtml(source.source_files.join(', '))
            : 'None';
        const specFiles = Array.isArray(source.spec_files) && source.spec_files.length
            ? escapeHtml(source.spec_files.map(f => String(f).split('/').pop()).join(', '))
            : 'None';
        html += '<div class="sandbox-meta">' +
            `<div><strong>Source:</strong> ${sourceFiles}</div>` +
            `<div><strong>Specs:</strong> ${specFiles}</div></div>`;
        return html;
    }

    return {
        escapeHtml,
        extractErrorMessage,
        renderConsoleLog,
        renderErrorTree,
        renderLibraryTags,
        renderSandboxResults,
        renderTestBadges,
    };
}));
