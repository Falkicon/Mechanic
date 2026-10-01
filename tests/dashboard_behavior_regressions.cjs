const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { createDashboard, scriptFiles, html, dashboardDir } = require('./dashboard_harness.cjs');

function postedCommands(requests) {
  return requests
    .filter(request => request.options && request.options.method === 'POST')
    .map(request => JSON.parse(request.options.body));
}

function settle() {
  return new Promise(resolve => setImmediate(resolve));
}

// Layout: the page is markup plus real files; no inline script, inline handlers or
// third-party network dependencies.
{
  const files = scriptFiles();
  assert.deepEqual(files, ['render.js', 'schema-form.js', 'state.js', 'api.js', 'views.js', 'app.js', 'ws.js', 'main.js']);
  for (const file of files) assert.ok(fs.existsSync(path.join(dashboardDir, file)), `${file} exists`);
  assert.doesNotMatch(html, /<script(?![^>]*\ssrc=)[^>]*>/i, 'no inline <script>');
  assert.doesNotMatch(html, /\son\w+\s*=/i, 'no inline event handler attributes');
  assert.doesNotMatch(html, /fonts\.googleapis|https?:\/\/(?!www\.w3\.org)/i, 'no external resources');
  const stylesheet = html.match(/<link rel="stylesheet" href="([^"]+)">/);
  assert.ok(stylesheet && fs.existsSync(path.join(dashboardDir, stylesheet[1])), 'dashboard.css is linked and present');
  assert.doesNotMatch(fs.readFileSync(path.join(dashboardDir, 'dashboard.css'), 'utf8'), /googleapis|@import|Inter'|JetBrains/);
  assert.match(html, /<button type="button" class="toggle-btn output-section-header" data-collapse="output-errors-body" aria-expanded="true"/);
  assert.match(html, /role="region" aria-label="Notifications" aria-live="polite"/);
  for (const file of files) {
    const source = fs.readFileSync(path.join(dashboardDir, file), 'utf8');
    assert.doesNotMatch(source, /addEventListener\('unload'|onunload/, `${file} avoids unload`);
    assert.doesNotMatch(source, /\bonclick=/, `${file} avoids inline handlers in rendered markup`);
  }
}

// Keyboard shortcuts ignore modifier combinations and editable targets.
{
  const dashboard = createDashboard();
  const [onKeydown] = dashboard.documentListeners.get('keydown');
  const toasts = () => dashboard.element('toast-container').children.length;
  const press = (key, extra = {}) => onKeydown({ key, target: { tagName: 'BODY' }, preventDefault() {}, ...extra });
  press('v', { ctrlKey: true });
  press('v', { metaKey: true });
  press('r', { ctrlKey: true });
  press('r', { altKey: true });
  press('r', { target: { tagName: 'INPUT' } });
  press('r', { target: { tagName: 'DIV', isContentEditable: true } });
  assert.equal(toasts(), 0);
  assert.equal(dashboard.element('cmd-name').textContent, '');
  press('r');
  assert.equal(toasts(), 1);
  press('R');
  assert.equal(toasts(), 2);
  press('v');
  assert.equal(dashboard.element('cmd-name').textContent, 'addon.validate');
}

// Toasts: warnings have their own style and icon; errors are announced as alerts.
{
  const dashboard = createDashboard();
  const container = dashboard.element('toast-container');
  dashboard.showToast('Sync', 'partial', 'warning');
  dashboard.showToast('Failed', 'nope', 'error');
  dashboard.showToast('Done', 'ok');
  const [warning, error, success] = container.children;
  assert.equal(warning.className, 'toast warning');
  assert.equal(warning.getAttribute('role'), 'status');
  assert.match(warning.children[0].textContent, /^⚠️ Sync$/);
  assert.equal(error.getAttribute('role'), 'alert');
  assert.match(error.children[0].textContent, /^❌/);
  assert.match(success.children[0].textContent, /^✅/);
  assert.equal(warning.children[1].textContent, 'partial');
  const css = fs.readFileSync(path.join(dashboardDir, 'dashboard.css'), 'utf8');
  assert.match(css, /\.toast\.warning\s*\{/);
  assert.doesNotMatch(css, /--bg-dark/);
}

// Command history is bounded per command and always points at the newest run.
{
  const dashboard = createDashboard();
  for (let i = 0; i < 75; i++) dashboard.addToHistory('addon.lint', { success: true, reasoning: `run ${i}` });
  assert.equal(dashboard.history()['addon.lint'].length, 50);
  assert.equal(dashboard.history()['addon.lint'][0].result.reasoning, 'run 25');
  assert.equal(dashboard.historyIndex()['addon.lint'], 49);
}

// Addon registration is a named function shared by every entry point.
async function testAddAddon() {
  const requests = [];
  const dashboard = createDashboard({
    fetchImpl: async (url, options = {}) => {
      requests.push({ url, options });
      return {
        json: async () => ({ success: true, data: { directory: 'C:/Addons/Weekly', filename: 'Weekly.toc' } }),
      };
    },
  });
  for (const id of ['btn-add-addon', 'btn-get-started', 'btn-settings-add-addon']) {
    assert.equal(typeof dashboard.element(id).onclick, 'function', `${id} has a handler`);
  }
  await dashboard.addAddon();
  assert.equal(JSON.stringify(dashboard.knownAddons()), '{"Weekly":"C:/Addons/Weekly"}');
  assert.equal(dashboard.selectedAddon(), 'Weekly');
  assert.equal(postedCommands(requests)[0].command, 'system.pick_file');

  await dashboard.element('btn-settings-add-addon').onclick();
  assert.equal(postedCommands(requests).length, 2, 'the settings button runs the same flow');
  const list = dashboard.element('settings-addon-list');
  assert.equal(list.children.length, 1);
  assert.equal(list.children[0].children[0].children[0].textContent, 'Weekly');
  assert.equal(list.children[0].children[1].getAttribute('aria-label'), 'Remove Weekly');
}

// A restored diagnostic target is read on startup and again after a reconnect.
async function testOutputRefresh() {
  const target = { client: 'C:/WoW/_retail_', account: 'A', character: 'Ada - Realm', profile: 'Ada' };
  const requests = [];
  const dashboard = createDashboard({
    diagnosticTarget: JSON.stringify(target),
    fetchImpl: async (url, options = {}) => {
      requests.push({ url, options });
      const body = options.body ? JSON.parse(options.body) : null;
      if (body?.command === 'diagnostic.targets') {
        return { json: async () => ({ success: true, data: { targets: [target] } }) };
      }
      if (body?.command === 'commands.list') return { json: async () => ({ success: true, data: { commands: [] } }) };
      if (body?.command === 'addon.output') {
        return { json: async () => ({ success: true, data: { error_count: 1, errors: [], tests: [{ passed: true }, { passed: false }] } }) };
      }
      if (url === '/health') return { json: async () => ({ status: 'healthy', version: '0.5.0', port: 3100 }) };
      return { json: async () => ({ history: [] }) };
    },
  });

  await dashboard.init();
  await settle();
  const commands = () => postedCommands(requests).map(body => body.command);
  assert.equal(commands().filter(name => name === 'addon.output').length, 1, 'init reads the restored target');
  assert.deepEqual(postedCommands(requests).find(body => body.command === 'addon.output').input.target, target);
  assert.equal(dashboard.element('output-test-count').textContent, '1/2');

  const socket = dashboard.sockets[0];
  socket.onopen();
  await settle();
  assert.equal(commands().filter(name => name === 'addon.output').length, 1, 'the first connection does not refetch');
  socket.readyState = 3;
  socket.onclose();
  const [timerId] = dashboard.timers.keys();
  dashboard.timers.get(timerId).callback();
  dashboard.timers.delete(timerId);
  dashboard.sockets[1].onopen();
  await settle();
  assert.equal(commands().filter(name => name === 'addon.output').length, 2, 'a reconnect re-reads the output');

  dashboard.eventListeners.get('pagehide')();
  dashboard.eventListeners.get('pageshow')({ persisted: true });
  assert.equal(dashboard.sockets.length, 3, 'a bfcache restore opens a fresh socket');
  dashboard.eventListeners.get('pageshow')({ persisted: false });
  assert.equal(dashboard.sockets.length, 3);
}

// Version, port and server status come from /health; missing fields degrade gracefully.
async function testServerInfo() {
  const respond = payload => createDashboard({
    fetchImpl: async () => ({ json: async () => payload }),
  });
  const read = dashboard => ({
    version: dashboard.element('app-version').textContent,
    port: dashboard.element('status-port').textContent,
    settingsPort: dashboard.element('settings-port').textContent,
    status: dashboard.element('settings-server-status').textContent,
    statusClass: dashboard.element('settings-server-status').className,
  });

  const full = respond({ status: 'healthy', version: '0.5.0', port: 4242 });
  await full.loadServerInfo();
  assert.deepEqual(read(full), {
    version: 'v0.5.0', port: 'Port 4242', settingsPort: '4242', status: 'Running', statusClass: 'value success',
  });

  const legacy = respond({ status: 'healthy' });
  await legacy.loadServerInfo();
  assert.deepEqual(read(legacy), {
    version: '', port: 'Port 3100', settingsPort: '3100', status: 'Running', statusClass: 'value success',
  });

  const down = createDashboard({ fetchImpl: async () => { throw new Error('offline'); } });
  await down.loadServerInfo();
  assert.equal(read(down).status, 'Unreachable');
  assert.equal(read(down).statusClass, 'value error');
  assert.equal(read(down).version, '');
}

// The sidebar is rendered from the catalog: only registered commands get buttons and
// mutation flags and descriptions come from the schema, not the page.
{
  const dashboard = createDashboard();
  dashboard.renderSidebar();
  const sidebar = dashboard.element('sidebar-commands');
  const commandsOf = () => sidebar.children.flatMap(section => section.children.slice(1))
    .map(button => button.dataset.cmd || `view:${button.dataset.view}`);
  assert.ok(commandsOf().includes('addon.validate'), 'without a catalog every curated entry stays reachable');
  assert.ok(commandsOf().includes('view:libraries'));

  dashboard.installCommandCatalog([
    { name: 'addon.validate', description: 'Validate the TOC', input_schema: { type: 'object' }, mutation: false },
    { name: 'release.all', description: 'Release', input_schema: { type: 'object' }, mutation: true },
    { name: 'extension.custom', description: 'x', input_schema: { type: 'object' }, mutation: false },
  ]);
  assert.deepEqual(commandsOf(), ['addon.validate', 'release.all', 'view:libraries']);
  const buttons = sidebar.children.flatMap(section => section.children.slice(1));
  const validate = buttons.find(button => button.dataset.cmd === 'addon.validate');
  const release = buttons.find(button => button.dataset.cmd === 'release.all');
  assert.equal(validate.title, 'Validate the TOC');
  assert.equal(validate.className, 'cmd-btn');
  assert.equal(release.className, 'cmd-btn mutating');
  assert.equal(release.title, 'Release (changes state)');
  assert.equal(validate.type, 'button');
  validate.dispatch('click');
  assert.equal(dashboard.element('cmd-name').textContent, 'addon.validate');
}

// Output pane: hostile addon data is neutralised and counts are populated.
{
  const dashboard = createDashboard();
  dashboard.updateOutputPane({
    error_count: 2,
    errors: [{ addon: 'Evil', file: 'x.lua', line: 1, message: 'a:b:c:<img src=x onerror=alert(1)>', counter: '<img src=x onerror=alert(1)>' }],
    tests: [{ addon: 'Evil', name: '<script>', passed: true }, { addon: 'Evil', name: 'b', passed: false }],
    console: [{ source: '<b>', category: 'Debug', message: '<i>' }],
    libraries: [{ name: '<u>', version: '1' }],
  });
  assert.equal(dashboard.element('output-test-count').textContent, '1/2');
  for (const id of ['output-error-tree', 'output-addon-tests-container', 'output-console-entries', 'output-libraries-row']) {
    assert.doesNotMatch(dashboard.element(id).innerHTML, /<(img|script|b|i|u)[\s>]/, id);
  }
  dashboard.clearOutputPane('cleared');
  assert.equal(dashboard.element('output-test-count').textContent, '0/0');
}

// Disclosure buttons toggle their panel and keep aria-expanded in sync.
{
  const dashboard = createDashboard();
  const panel = dashboard.element('panel-1');
  const trigger = dashboard.element('trigger-1');
  trigger.dataset.toggle = 'panel-1';
  dashboard.toggleDisclosure(trigger);
  assert.ok(panel.classList.contains('expanded'));
  assert.ok(trigger.classList.contains('expanded'));
  assert.equal(trigger.getAttribute('aria-expanded'), 'true');
  dashboard.toggleDisclosure(trigger);
  assert.equal(trigger.getAttribute('aria-expanded'), 'false');

  const section = dashboard.element('section-1');
  const header = dashboard.element('header-1');
  header.dataset.collapse = 'section-1';
  dashboard.toggleDisclosure(header);
  assert.ok(section.classList.contains('collapsed'));
  assert.equal(header.getAttribute('aria-expanded'), 'false');
  dashboard.toggleDisclosure(header);
  assert.equal(header.getAttribute('aria-expanded'), 'true');

  const [onClick] = dashboard.documentListeners.get('click');
  trigger.dataset.toggle = 'panel-1';
  onClick({ target: { closest: () => trigger } });
  assert.ok(panel.classList.contains('expanded'), 'delegated clicks reach disclosure buttons');
  onClick({ target: { closest: () => null } });
}

Promise.all([testAddAddon(), testOutputRefresh(), testServerInfo()])
  .then(() => console.log('dashboard behavior regressions passed'))
  .catch(error => {
    console.error(error);
    process.exitCode = 1;
  });
