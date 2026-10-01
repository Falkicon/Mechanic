// Loads the real dashboard scripts (in index.html order) into a vm context with a
// minimal fake DOM. main.js is skipped so tests decide when init() runs.
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const dashboardDir = path.join(__dirname, '..', 'desktop', 'dashboard');
const html = fs.readFileSync(path.join(dashboardDir, 'index.html'), 'utf8');
const MechanicSchemaForm = require(path.join(dashboardDir, 'schema-form.js'));
const MechanicRender = require(path.join(dashboardDir, 'render.js'));

function scriptFiles() {
  return [...html.matchAll(/<script\s+src="([^"]+)"\s*><\/script>/g)].map(match => match[1]);
}

function createElement(document, tagName = 'div') {
  const listeners = new Map();
  const attributes = new Map();
  const classes = new Set();
  const element = {
    ownerDocument: document,
    tagName: String(tagName).toUpperCase(),
    children: [],
    dataset: {},
    value: '',
    textContent: '',
    innerHTML: '',
    title: '',
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
    attributes,
    setAttribute(name, value) { attributes.set(name, String(value)); },
    getAttribute(name) { return attributes.has(name) ? attributes.get(name) : null; },
    append(...children) { element.children.push(...children); },
    appendChild(child) { element.children.push(child); return child; },
    replaceChildren(...children) { element.children = [...children]; },
    addEventListener(type, handler) { listeners.set(type, handler); },
    dispatch(type, event = {}) { listeners.get(type)?.({ target: element, ...event }); },
    closest() { return null; },
    querySelector() { return null; },
    querySelectorAll() { return []; },
    remove() {},
    focus() {},
  };
  Object.defineProperty(element, 'className', {
    get() { return [...classes].join(' '); },
    set(value) { classes.clear(); String(value).split(/\s+/).filter(Boolean).forEach(name => classes.add(name)); },
  });
  return element;
}

function createDashboard({ addons, diagnosticTarget, activeView, protocol = 'http:', fetchImpl } = {}) {
  const elements = new Map();
  const timers = new Map();
  const eventListeners = new Map();
  const documentListeners = new Map();
  const sockets = [];
  let nextTimerId = 1;

  class FakeWebSocket {
    constructor(url) {
      this.url = url;
      this.readyState = FakeWebSocket.CONNECTING;
      sockets.push(this);
    }
    close() { this.readyState = FakeWebSocket.CLOSED; }
  }
  FakeWebSocket.CONNECTING = 0;
  FakeWebSocket.OPEN = 1;
  FakeWebSocket.CLOSING = 2;
  FakeWebSocket.CLOSED = 3;

  const storage = new Map();
  const localStorage = {
    getItem(key) {
      if (storage.has(key)) return storage.get(key);
      if (key === 'mechanic.addons') return addons === undefined ? null : addons;
      if (key === 'mechanic.diagnosticTarget') return diagnosticTarget === undefined ? null : diagnosticTarget;
      if (key === 'mechanic.activeView') return activeView === undefined ? null : activeView;
      return null;
    },
    setItem(key, value) { storage.set(key, String(value)); },
    removeItem(key) { storage.set(key, null); },
  };
  const document = {
    getElementById(id) {
      if (!elements.has(id)) elements.set(id, createElement(document));
      return elements.get(id);
    },
    createElement(tagName) { return createElement(document, tagName); },
    querySelector() { return null; },
    querySelectorAll() { return []; },
    addEventListener(type, handler) {
      if (!documentListeners.has(type)) documentListeners.set(type, []);
      documentListeners.get(type).push(handler);
    },
  };
  const window = {
    location: { protocol, host: 'localhost:3100', port: '3100' },
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
    Map,
    Set,
    MechanicSchemaForm,
    MechanicRender,
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
    __documentListeners: documentListeners,
    setInterval: () => 0,
    setTimeout(callback, delay) {
      const id = nextTimerId++;
      timers.set(id, { callback, delay });
      return id;
    },
    clearTimeout(id) { timers.delete(id); },
  };
  context.__elements = elements;
  vm.createContext(context);

  for (const file of scriptFiles()) {
    if (file === 'main.js' || file === 'render.js' || file === 'schema-form.js') continue;
    vm.runInContext(fs.readFileSync(path.join(dashboardDir, file), 'utf8'), context, { filename: file });
  }
  vm.runInContext(`
globalThis.__dashboardTest = {
  knownAddons: () => knownAddons,
  sockets: globalThis.__sockets,
  timers: globalThis.__timers,
  eventListeners: globalThis.__eventListeners,
  documentListeners: globalThis.__documentListeners,
  history: () => commandHistory,
  historyIndex: () => historyIndex,
  selectedTarget: () => selectedDiagnosticTarget,
  selectedAddon: () => selectedAddon,
  catalog: () => commandCatalog,
  elements: globalThis.__elements,
  installCommandCatalog,
  navigateToCommand,
  getCurrentCommandInput,
  setCommandInputMode,
  installDiagnosticTargets,
  fetchAddonOutput,
  updateTestResults,
  updateOutputPane,
  clearOutputPane,
  renderSidebar,
  renderServerInfo,
  loadServerInfo,
  addToHistory,
  addAddon,
  showToast,
  toggleDisclosure,
  init,
};`, context, { filename: 'dashboard-test-exports.js' });
  context.__dashboardTest.element = id => document.getElementById(id);
  return context.__dashboardTest;
}

module.exports = { createDashboard, MechanicSchemaForm, MechanicRender, scriptFiles, html, dashboardDir };
