// Shared dashboard state and element references. Classic script: later files
// (api.js, views.js, app.js, ws.js) share these top-level bindings.
const { escapeHtml, extractErrorMessage, renderConsoleLog, renderErrorTree, renderLibraryTags,
    renderSandboxResults, renderTestBadges } = globalThis.MechanicRender;

const MAX_HISTORY_PER_COMMAND = 50;

let selectedAddon = localStorage.getItem('mechanic.selectedAddon') || '';
let currentCommand = null;
let startTime = Date.now();
let commandCatalog = new Map();
let activeSchemaForm = null;
let commandInputMode = 'form';
let diagnosticTargets = [];
let selectedDiagnosticTarget = loadStoredDiagnosticTarget();
let outputData = { errors: [], tests: [], console: [], timestamp: null };
let consoleFilter = 'all';

// Command history: { "addon.validate": [{ result, timestamp }, ...], ... }
const commandHistory = {};
// Current index per command: { "addon.validate": 0, ... }
const historyIndex = {};

// { "MyAddon": "C:/Path/To/MyAddon" }
function loadKnownAddons() {
    try {
        const stored = localStorage.getItem('mechanic.addons');
        if (!stored) return {};

        const parsed = JSON.parse(stored);
        const prototype = parsed && typeof parsed === 'object'
            ? Object.getPrototypeOf(parsed)
            : null;
        if (prototype !== Object.prototype || Array.isArray(parsed)) return {};
        if (Object.values(parsed).some(value => typeof value !== 'string')) return {};
        return parsed;
    } catch (e) {
        return {};
    }
}

function loadStoredDiagnosticTarget() {
    try {
        const parsed = JSON.parse(localStorage.getItem('mechanic.diagnosticTarget') || 'null');
        if (!parsed || typeof parsed !== 'object' || Array.isArray(parsed)) return null;
        const target = {};
        for (const key of ['client', 'account', 'character', 'profile']) {
            if (parsed[key] !== null && parsed[key] !== undefined && typeof parsed[key] !== 'string') return null;
            if (typeof parsed[key] === 'string' && parsed[key]) target[key] = parsed[key];
        }
        return Object.keys(target).length ? target : null;
    } catch (error) {
        return null;
    }
}

let knownAddons = loadKnownAddons();

const addonSelect = document.getElementById('addon-select');
const addonStatus = document.getElementById('addon-status');
const statusDot = document.getElementById('status-dot');
const statusText = document.getElementById('status-text');
const uptimeEl = document.getElementById('uptime');
const consoleOutput = document.getElementById('console-output');
const consoleCmd = document.getElementById('console-cmd');
const consoleInput = document.getElementById('console-input');
const accountsInfo = document.getElementById('accounts-info');
const mechanicTab = document.getElementById('mechanic-tab');
const sandboxTab = document.getElementById('sandbox-tab');
const commandPicker = document.getElementById('command-picker');
const catalogStatus = document.getElementById('catalog-status');
const sidebarCommands = document.getElementById('sidebar-commands');
const diagnosticTargetSelect = document.getElementById('diagnostic-target');
const targetStatus = document.getElementById('target-status');

const cmdName = document.getElementById('cmd-name');
const cmdDesc = document.getElementById('cmd-desc');
const cmdStatus = document.getElementById('cmd-status');
const cmdTime = document.getElementById('cmd-time');
const cmdNoResult = document.getElementById('cmd-no-result');
const cmdResult = document.getElementById('cmd-result');
const btnPrev = document.getElementById('btn-prev');
const btnNext = document.getElementById('btn-next');
const historyInfo = document.getElementById('history-info');
const btnRunCmd = document.getElementById('btn-run-cmd');
const cmdMutation = document.getElementById('cmd-mutation');
const cmdSchemaForm = document.getElementById('cmd-schema-form');
const cmdRawInput = document.getElementById('cmd-raw-input');
const cmdInputError = document.getElementById('cmd-input-error');
const btnFormMode = document.getElementById('btn-form-mode');
const btnRawMode = document.getElementById('btn-raw-mode');
