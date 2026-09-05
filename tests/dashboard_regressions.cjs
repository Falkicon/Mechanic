const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const dashboardPath = path.join(__dirname, '..', 'desktop', 'dashboard', 'index.html');
const schemaFormPath = path.join(__dirname, '..', 'desktop', 'dashboard', 'schema-form.js');
const MechanicSchemaForm = require(schemaFormPath);
const html = fs.readFileSync(dashboardPath, 'utf8');
const dashboardScript = html.match(/<script>\s*([\s\S]*?)<\/script>/)[1]
  .replace(/\s*init\(\);\s*$/, '\n');

function createElement(document, tagName = 'div') {
  const listeners = new Map();
  const classes = new Set();
  const element = {
    ownerDocument: document,
    tagName: String(tagName).toUpperCase(),
    children: [],
    dataset: {},
    value: '',
    textContent: '',
    innerHTML: '',
    classList: {
      add(...names) { names.forEach(name => classes.add(name)); },
      remove(...names) { names.forEach(name => classes.delete(name)); },
      toggle(name, force) {
        const enabled = force === undefined ? !classes.has(name) : force;
        if (enabled) classes.add(name); else classes.delete(name);
        return enabled;
      },
      contains(name) { return classes.has(name); },
    },
    style: {},
    append(...children) { element.children.push(...children); },
    appendChild(child) { element.children.push(child); return child; },
    replaceChildren(...children) { element.children = [...children]; },
    addEventListener(type, handler) { listeners.set(type, handler); },
    dispatch(type, event = {}) { listeners.get(type)?.({ target: element, ...event }); },
    remove() {},
    focus() {},
  };
  return element;
}

function createDashboard({ addons, diagnosticTarget, activeView, protocol = 'http:', fetchImpl } = {}) {
  const elements = new Map();
  const timers = new Map();
  const eventListeners = new Map();
  const sockets = [];
  let nextTimerId = 1;

  class FakeWebSocket {
    constructor(url) {
      this.url = url;
      this.readyState = FakeWebSocket.CONNECTING;
      sockets.push(this);
    }
  }
  FakeWebSocket.CONNECTING = 0;
  FakeWebSocket.OPEN = 1;
  FakeWebSocket.CLOSING = 2;
  FakeWebSocket.CLOSED = 3;

  const localStorage = {
    getItem(key) {
      if (key === 'mechanic.addons') return addons;
      if (key === 'mechanic.diagnosticTarget') return diagnosticTarget;
      if (key === 'mechanic.activeView') return activeView;
      return null;
    },
    setItem() {},
    removeItem() {},
  };
  const document = {
    getElementById(id) {
      if (!elements.has(id)) elements.set(id, createElement(document));
      return elements.get(id);
    },
    createElement(tagName) { return createElement(document, tagName); },
    querySelector() { return null; },
    querySelectorAll() { return []; },
    addEventListener() {},
  };
  const window = {
    location: { protocol, host: 'localhost:3100' },
    addEventListener(event, handler) { eventListeners.set(event, handler); },
  };

  const context = {
    console,
    Date,
    JSON,
    Math,
    Object,
    Promise,
    String,
    Array,
    Number,
    Boolean,
    Error,
    RegExp,
    MechanicSchemaForm,
    document,
    localStorage,
    window,
    WebSocket: FakeWebSocket,
    fetch: fetchImpl || (async () => ({ json: async () => ({}) })),
    confirm: () => true,
    navigator: { clipboard: { writeText: async () => {} } },
    __sockets: sockets,
    __timers: timers,
    __eventListeners: eventListeners,
    setInterval: () => 0,
    setTimeout(callback, delay) {
      const id = nextTimerId++;
      timers.set(id, { callback, delay });
      return id;
    },
    clearTimeout(id) { timers.delete(id); },
  };
  context.__elements = elements;

  vm.runInNewContext(
    `${dashboardScript}
globalThis.__dashboardTest = {
  knownAddons: () => knownAddons,
  sockets: globalThis.__sockets,
  timers: globalThis.__timers,
  eventListeners: globalThis.__eventListeners,
  history: () => commandHistory,
  selectedTarget: () => selectedDiagnosticTarget,
  elements: globalThis.__elements,
  installCommandCatalog,
  navigateToCommand,
  getCurrentCommandInput,
  setCommandInputMode,
  installDiagnosticTargets,
  fetchAddonOutput,
  updateTestResults,
  init,
};`,
    context,
  );
  return context.__dashboardTest;
}

function runTimer(testState, id) {
  const timer = testState.timers.get(id);
  assert.ok(timer, `expected timer ${id} to exist`);
  testState.timers.delete(id);
  timer.callback();
  return timer;
}

{
  const malformed = createDashboard({ addons: '{not valid json' });
  assert.equal(JSON.stringify(malformed.knownAddons()), '{}');

  const valid = createDashboard({ addons: '{"Weekly":"C:/Addons/Weekly"}' });
  assert.equal(JSON.stringify(valid.knownAddons()), '{"Weekly":"C:/Addons/Weekly"}');

  const wrongShape = createDashboard({ addons: '["Weekly"]' });
  assert.equal(JSON.stringify(wrongShape.knownAddons()), '{}');

  const wrongValueType = createDashboard({ addons: '{"Weekly":42}' });
  assert.equal(JSON.stringify(wrongValueType.knownAddons()), '{}');

  const malformedTarget = createDashboard({ diagnosticTarget: '{broken' });
  assert.equal(malformedTarget.selectedTarget(), null);
  const wrongTargetType = createDashboard({ diagnosticTarget: '{"client":42}' });
  assert.equal(wrongTargetType.selectedTarget(), null);
  const validTarget = createDashboard({ diagnosticTarget: '{"client":"C:/WoW/_retail_","account":"A"}' });
  assert.equal(JSON.stringify(validTarget.selectedTarget()), '{"client":"C:/WoW/_retail_","account":"A"}');
}

{
  const dashboard = createDashboard();
  assert.equal(dashboard.sockets.length, 1);
  assert.equal(dashboard.sockets[0].url, 'ws://localhost:3100/ws');

  dashboard.sockets[0].onmessage({ data: '{not valid json' });
  dashboard.sockets[0].onmessage({ data: 'null' });
  dashboard.sockets[0].onmessage({ data: '{"type":"command_result","command":"addon.validate","result":null}' });
  dashboard.sockets[0].onmessage({
    data: JSON.stringify({
      type: 'command_result',
      command: 'addon.validate',
      result: { success: true, reasoning: 'done' },
    }),
  });
  assert.equal(dashboard.history()['addon.validate'].length, 1);
  for (const [id, timer] of dashboard.timers) {
    if (timer.delay === 10000) dashboard.timers.delete(id);
  }

  dashboard.sockets[0].readyState = 3;
  dashboard.sockets[0].onclose();
  assert.equal(dashboard.timers.size, 1);
  const firstTimerId = [...dashboard.timers.keys()][0];
  assert.equal(dashboard.timers.get(firstTimerId).delay, 1000);
  dashboard.sockets[0].onclose();
  assert.equal(dashboard.timers.size, 1);

  runTimer(dashboard, firstTimerId);
  assert.equal(dashboard.sockets.length, 2);
  assert.equal(dashboard.sockets[1].url, 'ws://localhost:3100/ws');

  dashboard.sockets[1].readyState = 3;
  dashboard.sockets[1].onclose();
  const secondTimerId = [...dashboard.timers.keys()][0];
  assert.equal(dashboard.timers.get(secondTimerId).delay, 2000);

  let timerId = secondTimerId;
  for (const expectedDelay of [4000, 8000, 16000, 30000, 30000]) {
    runTimer(dashboard, timerId);
    const socket = dashboard.sockets.at(-1);
    socket.readyState = 3;
    socket.onclose();
    timerId = [...dashboard.timers.keys()][0];
    assert.equal(dashboard.timers.get(timerId).delay, expectedDelay);
  }
}

{
  const dashboard = createDashboard({ protocol: 'https:' });
  assert.equal(dashboard.sockets[0].url, 'wss://localhost:3100/ws');

  dashboard.sockets[0].readyState = 3;
  dashboard.sockets[0].onclose();
  const reconnectTimerId = [...dashboard.timers.keys()][0];
  dashboard.eventListeners.get('unload')();
  assert.equal(dashboard.timers.size, 0);
  assert.equal(dashboard.timers.has(reconnectTimerId), false);
  assert.equal(dashboard.sockets.length, 1);
}

console.log('dashboard regressions passed');

module.exports = { createDashboard, MechanicSchemaForm };
