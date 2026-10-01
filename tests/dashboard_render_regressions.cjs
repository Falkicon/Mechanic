// render.js produces HTML strings from untrusted command, SavedVariables and addon
// data. These tests feed hostile fixtures and assert that no data-derived markup,
// attribute or event handler survives in the output.
const assert = require('node:assert/strict');
const MechanicRender = require('../desktop/dashboard/render.js');

const {
  escapeHtml,
  extractErrorMessage,
  renderConsoleLog,
  renderErrorTree,
  renderLibraryTags,
  renderSandboxResults,
  renderTestBadges,
} = MechanicRender;

const PAYLOADS = [
  '<img src=x onerror=alert(1)>',
  '<script>alert(1)</script>',
  '"><svg onload=alert(1)>',
  "' onmouseover='alert(1)",
  '</button><iframe src=javascript:alert(1)>',
];

// Every tag the renderers emit on their own. Anything else means data became markup.
const ALLOWED_TAGS = new Set(['div', 'span', 'button', 'strong', 'code', 'tr', 'td']);

function assertNoInjectedMarkup(html, label) {
  const tags = [...html.matchAll(/<\s*\/?\s*([a-zA-Z][\w-]*)([^>]*)>/g)];
  for (const [whole, name, attributes] of tags) {
    assert.ok(ALLOWED_TAGS.has(name.toLowerCase()), `${label}: unexpected <${name}> in ${whole}`);
    // Text inside a quoted value is inert; only attribute names outside quotes matter.
    const bare = attributes.replace(/"[^"]*"/g, '""');
    assert.doesNotMatch(bare, /(^|\s)on\w+\s*=/i, `${label}: event handler attribute in ${whole}`);
    assert.doesNotMatch(bare, /javascript:/i, `${label}: javascript: URL in ${whole}`);
  }
  // Attribute values are always quoted, so an unescaped quote from data would add attributes.
  for (const [, , attributes] of tags) {
    assert.equal((attributes.match(/"/g) || []).length % 2, 0, `${label}: unbalanced quotes in ${attributes}`);
  }
  assert.doesNotMatch(html, /<(img|script|svg|iframe)/i, `${label}: injected element`);
}

assert.equal(escapeHtml('<a href="x">&\'</a>'), '&lt;a href=&quot;x&quot;&gt;&amp;&#39;&lt;/a&gt;');
assert.equal(escapeHtml(null), '');
assert.equal(escapeHtml(42), '42');
assert.equal(extractErrorMessage('a:b:c:the real message'), 'the real message');
assert.equal(extractErrorMessage(null), '');
assert.equal(extractErrorMessage(12345), '12345');

for (const payload of PAYLOADS) {
  const errors = renderErrorTree([
    {
      addon: payload, file: payload, line: payload, message: `x:y:z:${payload}`,
      stack: payload, counter: payload,
    },
    { addon: 'Safe', file: 'f.lua', line: 1, message: payload, stack: payload, counter: `5${payload}` },
    { addon: 'Safe', message: 'numeric string counter', counter: '7' },
  ]);
  assertNoInjectedMarkup(errors, `errors(${payload})`);

  const tests = renderTestBadges([
    {
      addon: payload, category: payload, name: payload, message: payload, passed: false,
      duration: payload,
      details: { a: payload, b: { label: payload, value: payload, status: payload }, c: { msg: payload }, d: payload + 1 },
      logs: [payload, payload],
    },
    { addon: 'Safe', name: payload, passed: true, details: { x: { foo: payload } } },
  ], {
    [payload]: [{ name: payload, description: payload, ms: payload, percent: payload }],
    Safe: [{ name: payload, description: payload }],
  });
  assertNoInjectedMarkup(tests, `tests(${payload})`);

  const consoleHtml = renderConsoleLog([
    { source: payload, category: payload, message: payload },
    { source: payload, category: payload, message: payload },
    { source: 'Safe', category: 'Debug', message: `<b>${payload}</b>` },
  ], 'all');
  assertNoInjectedMarkup(consoleHtml, `console(${payload})`);

  const libs = renderLibraryTags([{ name: payload, version: payload }, { name: 'FenUI', version: payload }]);
  assertNoInjectedMarkup(libs, `libs(${payload})`);

  const sandbox = renderSandboxResults({
    tests: [
      { name: `${payload} > ${payload}`, passed: false, duration: 1.5, error: payload },
      { name: payload, passed: true },
    ],
    source_files: [payload],
    spec_files: [`dir/${payload}`],
  });
  assertNoInjectedMarkup(sandbox, `sandbox(${payload})`);
}

// A hostile string counter must neither execute nor be summed into the addon badge.
{
  const html = renderErrorTree([{ addon: 'Evil', message: 'm', counter: '<img src=x onerror=alert(1)>' }]);
  assert.match(html, /<span class="error-addon-count">1<\/span>/, 'non-numeric counters count as one occurrence');
  assert.doesNotMatch(html, /error-count/);
}
{
  const html = renderErrorTree([
    { addon: 'A', message: 'm', counter: 3 },
    { addon: 'A', message: 'n', counter: '4' },
  ]);
  assert.match(html, /<span class="error-addon-count">7<\/span>/);
  assert.match(html, /×3/);
}

// Names that collide with Object.prototype keys must group like any other addon.
{
  const html = renderErrorTree([
    { addon: '__proto__', message: 'a:b:c:one' },
    { addon: 'constructor', message: 'a:b:c:two' },
    { addon: 'hasOwnProperty', message: 'a:b:c:three' },
  ]);
  for (const name of ['__proto__', 'constructor', 'hasOwnProperty']) assert.match(html, new RegExp(`> ${name}</span>`));
  const tests = renderTestBadges(
    [{ addon: '__proto__', category: '__proto__', name: 't', passed: true }],
    { __proto__: [], constructor: 'x' },
  );
  assert.match(tests, /TESTS: __proto__/);
  assert.match(tests, /1\/1 Passed/);
  assert.match(renderSandboxResults({ tests: [{ name: '__proto__ > t', passed: true }] }), /__proto__/);
}

// Structure: disclosure headers are real buttons wired to their panel.
{
  const html = renderErrorTree([{ addon: 'A', file: 'f.lua', line: 3, message: 'a:b:c:boom', stack: 'stack text' }]);
  assert.match(html, /<button type="button" class="toggle-btn error-addon-header" data-toggle="addon-errors-0" aria-expanded="false" aria-controls="addon-errors-0">/);
  assert.match(html, /<div id="addon-errors-0" class="error-addon-items">/);
  assert.match(html, /<button type="button" class="toggle-btn error-item" data-toggle="err-0-0"/);
  assert.match(html, /<div id="err-0-0" class="error-detail">stack text<\/div>/);
  assert.doesNotMatch(html, /onclick=/);

  const tests = renderTestBadges([{ addon: 'A', name: 'T', passed: true, message: 'note' }], {});
  assert.match(tests, /data-collapse="output-section-tests-0-body" aria-expanded="true"/);
  assert.match(tests, /<button type="button" class="toggle-btn test-row" data-toggle="test-0-0-0"/);
  assert.match(tests, /1\/1 Passed/);
  const plain = renderTestBadges([{ addon: 'A', name: 'T', passed: true }], {});
  assert.match(plain, /<div class="test-row no-click">/, 'rows without details are not interactive');
}

// Tests without an addon are grouped under !Mechanic and counted correctly.
{
  const html = renderTestBadges([{ name: 'a', passed: true }, { name: 'b', passed: false }], null);
  assert.match(html, /TESTS: !Mechanic/);
  assert.match(html, /1\/2 Passed/);
}

// Bounds and empty states.
{
  const many = Array.from({ length: 14 }, (_, i) => ({ addon: 'A', message: `a:b:c:e${i}` }));
  const html = renderErrorTree(many);
  assert.equal((html.match(/data-toggle="err-0-/g) || []).length, 10);
  assert.match(html, /\.\.\. and 4 more/);
  assert.match(renderErrorTree([]), /No errors/);
  assert.match(renderErrorTree(null), /No errors/);
  assert.match(renderErrorTree(['x', 7, null]), /No errors/);
  assert.match(renderConsoleLog([], 'all'), /No console entries/);
  assert.equal(renderTestBadges([], {}), '');
  assert.equal(renderLibraryTags([]), '');
  assert.match(renderSandboxResults({ tests: [] }), /No tests found/);

  const entries = Array.from({ length: 80 }, (_, i) => ({ source: 'S', category: 'Debug', message: `m${i}` }));
  assert.equal((renderConsoleLog(entries, 'all').match(/class="console-entry"/g) || []).length, 50);
  const repeated = renderConsoleLog([{ message: 'x' }, { message: 'x' }, { message: 'x' }], 'all');
  assert.match(repeated, /\(x3\)/);
  const filtered = renderConsoleLog([{ source: 'A', category: 'Debug', message: 'keep' }, { source: 'B', category: 'Error', message: 'drop' }], 'Debug');
  assert.match(filtered, /keep/);
  assert.doesNotMatch(filtered, /drop/);
}

console.log('dashboard render regressions passed');
