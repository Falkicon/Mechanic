// DOM updates: toasts, views, command catalog/sidebar, libraries, settings, sandbox
// and the addon output pane. All data-driven markup comes from render.js.

// Sidebar entries are curated labels/icons; the commands themselves, their
// descriptions and mutation flags come from the `commands.list` catalog.
const SIDEBAR_GROUPS = [
    { title: 'Development', items: [
        { command: 'addon.validate', label: 'Validate', icon: '✓' },
        { command: 'addon.lint', label: 'Lint', icon: '🔍' },
        { command: 'addon.format', label: 'Format', icon: '✨' },
        { command: 'addon.test', label: 'Test', icon: '🧪' },
        { command: 'addon.deprecations', label: 'Deprecations', icon: '⚠️' },
    ] },
    { title: 'Release', items: [
        { command: 'release.all', label: 'Release All', icon: '🚀' },
        { command: 'version.bump', label: 'Bump Version', icon: '🏷️' },
        { command: 'changelog.add', label: 'Changelog', icon: '📝' },
        { command: 'git.commit', label: 'Commit', icon: '💾' },
        { command: 'git.tag', label: 'Tag', icon: '🔖' },
    ] },
    { title: 'Quality', items: [
        { command: 'locale.validate', label: 'Validate Locale', icon: '🗣️' },
        { command: 'locale.extract', label: 'Extract Locals', icon: '📤' },
        { command: 'atlas.search', label: 'Atlas', icon: '🎨' },
    ] },
    { title: 'Libraries', items: [
        { view: 'libraries', label: 'Library Manager', icon: '📊' },
        { command: 'libs.check', label: 'Check Status', icon: '✓' },
        { command: 'libs.sync', label: 'Sync Libraries', icon: '🔄' },
        { command: 'libs.init', label: 'Init Config', icon: '📝' },
    ] },
    { title: 'Sync', items: [
        { command: 'addon.sync', label: 'Sync to Client', icon: '📂' },
    ] },
];

const TOAST_ICONS = { success: '✅', error: '❌', warning: '⚠️' };

// Update addon dropdown from known addons (discovered + user-added)
function updateAddonList() {
    const allAddons = Object.keys(knownAddons).sort();
    const overlay = document.getElementById('get-started-overlay');

    if (allAddons.length === 0) {
        const option = document.createElement('option');
        option.value = '';
        option.textContent = 'Add an addon...';
        addonSelect.replaceChildren(option);
        addonStatus.textContent = 'Click + to add an addon';
        addonStatus.title = '';
        selectedAddon = '';
        overlay.classList.add('hidden');
        return;
    }

    overlay.classList.add('hidden');
    addonSelect.replaceChildren(...allAddons.map(addon => {
        const option = document.createElement('option');
        option.value = addon;
        option.textContent = addon;
        return option;
    }));

    if (selectedAddon && allAddons.includes(selectedAddon)) {
        addonSelect.value = selectedAddon;
    } else {
        selectedAddon = allAddons[0];
        addonSelect.value = selectedAddon;
    }
    updateAddonStatus();
}

function updateAddonStatus() {
    const overlay = document.getElementById('get-started-overlay');

    if (!selectedAddon) {
        addonStatus.textContent = 'Click + to add an addon';
        addonStatus.title = '';
        overlay.classList.add('hidden');
        return;
    }

    overlay.classList.add('hidden');

    const addonPath = knownAddons[selectedAddon];
    if (addonPath) {
        // Show truncated path (start of path), full path on hover
        const shortPath = addonPath.length > 35 ? addonPath.slice(-35) + '…' : addonPath;
        addonStatus.textContent = shortPath;
        addonStatus.title = addonPath; // Full path on hover
    } else {
        addonStatus.textContent = '✓ Registered';
        addonStatus.title = '';
    }

    if (currentCommand && commandCatalog.has(currentCommand)) renderCommandInput(currentCommand);
}

async function addAddon() {
    try {
        const res = await executeCommand('system.pick_file', {
            title: 'Select Addon TOC File',
            filter: 'WoW Addon TOC (*.toc)|*.toc'
        });

        if (res.success && res.data) {
            const fullPath = res.data.directory;
            const addonName = String(res.data.filename || '').replace(/\.toc$/i, '');
            if (!addonName || typeof fullPath !== 'string' || !fullPath) return;

            knownAddons[addonName] = fullPath;
            localStorage.setItem('mechanic.addons', JSON.stringify(knownAddons));

            selectedAddon = addonName;
            localStorage.setItem('mechanic.selectedAddon', addonName);

            updateAddonList();
            showToast('Addon Added', `Registered ${addonName}`, 'success');
        }
    } catch (e) {
        showToast('Error', 'Failed to pick file', 'error');
    }
}

function showToast(title, message, type = 'success') {
    const container = document.getElementById('toast-container');
    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.setAttribute('role', type === 'error' ? 'alert' : 'status');
    const toastTitle = document.createElement('div');
    toastTitle.className = 'toast-title';
    toastTitle.textContent = `${TOAST_ICONS[type] || TOAST_ICONS.success} ${title}`;
    const toastMessage = document.createElement('div');
    toastMessage.className = 'toast-message';
    toastMessage.textContent = message;
    toast.append(toastTitle, toastMessage);
    container.appendChild(toast);

    setTimeout(() => {
        toast.style.animation = 'fadeOut 0.3s ease-out';
        setTimeout(() => toast.remove(), 300);
    }, 10000);
}

function showView(viewName, refresh = true) {
    document.querySelectorAll('.view').forEach(v => v.classList.remove('active'));
    document.getElementById(`view-${viewName}`).classList.add('active');

    mechanicTab.classList.toggle('active', viewName === 'mechanic');
    sandboxTab.classList.toggle('active', viewName === 'sandbox');
    document.querySelectorAll('.cmd-btn').forEach(b => b.classList.remove('active'));

    if (viewName === 'command' && currentCommand) {
        const btn = Array.from(document.querySelectorAll('[data-cmd]'))
            .find(candidate => candidate.dataset.cmd === currentCommand);
        if (btn) btn.classList.add('active');
    }

    const viewBtn = document.querySelector(`[data-view="${viewName}"]`);
    if (viewBtn) viewBtn.classList.add('active');

    localStorage.setItem('mechanic.activeView', viewName);

    // Auto-refresh data for specific views
    if (refresh && viewName === 'libraries') refreshLibraries();
    if (refresh && viewName === 'settings') refreshSettings();
    if (refresh && viewName === 'sandbox') refreshSandboxStubs();
}

function commandContext() {
    const context = {};
    if (selectedAddon) context.addon = selectedAddon;
    const addonPath = selectedAddon ? knownAddons[selectedAddon] : null;
    if (addonPath) context.path = addonPath;
    if (selectedDiagnosticTarget) context.target = selectedDiagnosticTarget;
    return context;
}

function showCommandInputErrors(errors) {
    const messages = Array.isArray(errors) ? errors.filter(Boolean) : [];
    cmdInputError.textContent = messages.join('\n');
    cmdInputError.classList.toggle('hidden', messages.length === 0);
}

function setCommandInputMode(mode) {
    if (mode === 'form' && commandInputMode === 'raw' && activeSchemaForm) {
        try {
            const rawValue = JSON.parse(cmdRawInput.value.trim() || '{}');
            if (!rawValue || typeof rawValue !== 'object' || Array.isArray(rawValue)) {
                throw new Error('Command input must be a JSON object');
            }
            activeSchemaForm.setValue(rawValue);
            showCommandInputErrors([]);
        } catch (error) {
            showCommandInputErrors([error.message]);
            return;
        }
    }
    commandInputMode = mode;
    const raw = mode === 'raw';
    cmdSchemaForm.classList.toggle('hidden', raw);
    cmdRawInput.classList.toggle('hidden', !raw);
    btnFormMode.classList.toggle('active', !raw);
    btnRawMode.classList.toggle('active', raw);
    btnFormMode.setAttribute('aria-pressed', String(!raw));
    btnRawMode.setAttribute('aria-pressed', String(raw));
}

function renderCommandInput(commandName) {
    const command = commandCatalog.get(commandName);
    activeSchemaForm = null;
    showCommandInputErrors([]);
    if (!command || !command.input_schema || !globalThis.MechanicSchemaForm ||
        !globalThis.MechanicSchemaForm.supportsSchemaForm(command.input_schema)) {
        cmdSchemaForm.replaceChildren();
        cmdSchemaForm.oninput = null;
        cmdRawInput.value = '{}';
        consoleInput.value = '{}';
        setCommandInputMode('raw');
        return;
    }

    activeSchemaForm = globalThis.MechanicSchemaForm.createSchemaForm(
        cmdSchemaForm,
        command.input_schema,
        { context: commandContext() }
    );
    const initial = activeSchemaForm.initialValue;
    cmdRawInput.value = JSON.stringify(initial, null, 2);
    consoleInput.value = JSON.stringify(initial);
    setCommandInputMode('form');
    cmdSchemaForm.oninput = () => {
        if (!activeSchemaForm) return;
        const parsed = activeSchemaForm.getValue();
        if (parsed.errors.length === 0) {
            cmdRawInput.value = JSON.stringify(parsed.value, null, 2);
            consoleInput.value = JSON.stringify(parsed.value);
            showCommandInputErrors([]);
        }
    };
}

function getCurrentCommandInput() {
    const command = commandCatalog.get(currentCommand);
    if (commandInputMode === 'form' && activeSchemaForm) return activeSchemaForm.getValue();
    let value;
    try {
        value = JSON.parse(cmdRawInput.value.trim() || '{}');
    } catch (error) {
        return { errors: [`Input must contain valid JSON: ${error.message}`] };
    }
    if (!value || typeof value !== 'object' || Array.isArray(value)) {
        return { errors: ['Command input must be a JSON object'] };
    }
    const errors = command && command.input_schema && globalThis.MechanicSchemaForm &&
        globalThis.MechanicSchemaForm.supportsSchemaForm(command.input_schema)
        ? globalThis.MechanicSchemaForm.validateValue(value, command.input_schema, command.input_schema, 'input')
        : [];
    return { value, errors };
}

function createSidebarButton(item, command) {
    const button = document.createElement('button');
    button.type = 'button';
    button.className = command && command.mutation ? 'cmd-btn mutating' : 'cmd-btn';
    if (item.command) {
        button.dataset.cmd = item.command;
        const description = command && command.description ? command.description : item.command;
        button.title = command && command.mutation ? `${description} (changes state)` : description;
        button.addEventListener('click', () => navigateToCommand(item.command));
    } else {
        button.dataset.view = item.view;
        button.addEventListener('click', () => showView(item.view));
    }
    const icon = document.createElement('span');
    icon.className = 'cmd-icon';
    icon.setAttribute('aria-hidden', 'true');
    icon.textContent = item.icon;
    const label = document.createElement('span');
    label.textContent = item.label;
    button.append(icon, label);
    return button;
}

// With a catalog, only registered commands get a button; without one (catalog
// unavailable) every curated entry stays reachable and the raw console still works.
function renderSidebar() {
    const hasCatalog = commandCatalog.size > 0;
    const sections = [];
    for (const group of SIDEBAR_GROUPS) {
        const buttons = [];
        for (const item of group.items) {
            if (item.command && hasCatalog && !commandCatalog.has(item.command)) continue;
            buttons.push(createSidebarButton(item, item.command ? commandCatalog.get(item.command) : null));
        }
        if (buttons.length === 0) continue;
        const section = document.createElement('div');
        section.className = 'sidebar-section';
        const title = document.createElement('div');
        title.className = 'sidebar-title';
        title.textContent = group.title;
        section.append(title, ...buttons);
        sections.push(section);
    }
    sidebarCommands.replaceChildren(...sections);
}

function installCommandCatalog(commands) {
    commandCatalog = new Map();
    for (const command of commands) {
        if (!command || typeof command.name !== 'string' || !command.name) continue;
        if (!command.input_schema || typeof command.input_schema !== 'object' || Array.isArray(command.input_schema)) continue;
        commandCatalog.set(command.name, {
            name: command.name,
            description: typeof command.description === 'string' ? command.description : '',
            input_schema: command.input_schema,
            output_schema: command.output_schema,
            mutation: command.mutation === true,
        });
    }
    const sorted = [...commandCatalog.values()].sort((left, right) => left.name.localeCompare(right.name));
    const placeholder = document.createElement('option');
    placeholder.value = '';
    placeholder.textContent = sorted.length ? 'Choose a command…' : 'No commands available';
    commandPicker.replaceChildren(placeholder, ...sorted.map(command => {
        const option = document.createElement('option');
        option.value = command.name;
        option.textContent = `${command.name}${command.mutation ? ' • changes state' : ''}`;
        return option;
    }));
    catalogStatus.textContent = `${sorted.length} registered command${sorted.length === 1 ? '' : 's'}`;
    renderSidebar();
}

function renderServerInfo(info) {
    const known = info !== null && typeof info === 'object' && !Array.isArray(info);
    const healthy = known && info.status === 'healthy';
    const version = healthy && typeof info.version === 'string' && info.version ? `v${info.version}` : '';
    document.getElementById('app-version').textContent = version;

    const port = known && Number.isInteger(info.port) ? String(info.port) : (window.location.port || '');
    document.getElementById('status-port').textContent = port ? `Port ${port}` : 'Port —';
    document.getElementById('settings-port').textContent = port || '—';

    const status = document.getElementById('settings-server-status');
    status.textContent = !known ? 'Unreachable' : (healthy ? 'Running' : 'Unknown');
    status.className = `value ${healthy ? 'success' : 'error'}`;
}

function targetSelector(target) {
    const selector = {};
    for (const key of ['client', 'account', 'character', 'profile']) {
        if (typeof target?.[key] === 'string' && target[key]) selector[key] = target[key];
    }
    return selector;
}

function targetsMatch(left, right) {
    return ['client', 'account', 'character', 'profile']
        .every(key => (left?.[key] || null) === (right?.[key] || null));
}

function installDiagnosticTargets(targets) {
    diagnosticTargets = targets.filter(target => target && typeof target === 'object' && !Array.isArray(target));
    const placeholder = document.createElement('option');
    placeholder.value = '';
    placeholder.textContent = 'Select a client/profile…';
    diagnosticTargetSelect.replaceChildren(placeholder, ...diagnosticTargets.map((target, index) => {
        const option = document.createElement('option');
        option.value = String(index);
        const characterProfile = [target.character, target.profile].filter(Boolean).join(' → ') || 'No profile';
        option.textContent = `${target.client || 'Unknown client'} • ${target.account || 'Unknown account'} • ${characterProfile}`;
        return option;
    }));
    const restoredIndex = selectedDiagnosticTarget
        ? diagnosticTargets.findIndex(target => targetsMatch(targetSelector(target), selectedDiagnosticTarget))
        : -1;
    if (restoredIndex >= 0) {
        selectedDiagnosticTarget = targetSelector(diagnosticTargets[restoredIndex]);
        diagnosticTargetSelect.value = String(restoredIndex);
        targetStatus.textContent = 'Explicit target selected';
    } else {
        selectedDiagnosticTarget = null;
        localStorage.removeItem('mechanic.diagnosticTarget');
        targetStatus.textContent = diagnosticTargets.length
            ? `${diagnosticTargets.length} target${diagnosticTargets.length === 1 ? '' : 's'} available; choose one`
            : 'No diagnostic targets found';
    }
}

function navigateToCommand(cmd) {
    currentCommand = cmd;
    cmdName.textContent = cmd;
    const command = commandCatalog.get(cmd);
    cmdDesc.textContent = command?.description || 'No schema description available. Raw JSON input remains available.';
    cmdMutation.textContent = command ? (command.mutation ? 'Changes state' : 'Read only') : 'Schema unavailable';
    cmdMutation.className = `mutation-badge ${command ? (command.mutation ? 'mutating' : 'read-only') : ''}`;
    consoleCmd.value = cmd;
    commandPicker.value = command ? cmd : '';
    renderCommandInput(cmd);

    showView('command');
    displayCurrentResult();
    localStorage.setItem('mechanic.activeCommand', cmd);
}

// ═══════════════════════════════════════════════════════════════════════════
// LIBRARY MANAGER
// ═══════════════════════════════════════════════════════════════════════════
function setLibraryTableMessage(message, isError) {
    const cell = `<tr><td colspan="4" class="table-note${isError ? ' error' : ''}">${escapeHtml(message)}</td></tr>`;
    document.getElementById('lib-table-body').innerHTML = cell;
}

async function refreshLibraries() {
    if (!selectedAddon) {
        setLibraryTableMessage('Select an addon first');
        return;
    }

    setLibraryTableMessage('Loading...');

    const result = await executeCommand('libs.check', { addon: selectedAddon });

    if (!result.success) {
        setLibraryTableMessage(result.error?.message || 'Failed to check libraries', true);
        return;
    }

    const data = result.data;

    const banner = document.getElementById('lib-config-banner');
    if (data.has_config) {
        banner.className = 'lib-config-status found';
        banner.innerHTML = `<span>✅</span><span><code>libs.json</code> found with ${escapeHtml(Number(data.configured_count) || 0)} libraries configured (mode: ${escapeHtml(data.mode || 'include')})</span>`;
    } else {
        banner.className = 'lib-config-status missing';
        banner.innerHTML = '<span>⚠️</span><span>No <code>libs.json</code> found. <button type="button" id="btn-lib-init" class="link-btn">Initialize config</button> to manage libraries.</span>';
        document.getElementById('btn-lib-init')?.addEventListener('click', initLibsConfig);
    }

    const libs = Array.isArray(data.libraries) ? data.libraries.filter(l => l && typeof l === 'object') : [];
    const okCount = libs.filter(l => l.status === 'ok').length;
    const missingCount = libs.filter(l => l.status === 'missing').length;
    const extraCount = libs.filter(l => l.status === 'extra').length;

    document.getElementById('lib-stat-ok').textContent = okCount;
    document.getElementById('lib-stat-missing').textContent = missingCount;
    document.getElementById('lib-stat-extra').textContent = extraCount;

    if (libs.length === 0) {
        setLibraryTableMessage('No libraries found');
        return;
    }

    // Sort: missing first, then extra, then ok
    libs.sort((a, b) => {
        const order = { missing: 0, extra: 1, ok: 2 };
        return (order[a.status] ?? 3) - (order[b.status] ?? 3);
    });

    document.getElementById('lib-table-body').innerHTML = libs.map(lib => {
        const statusClass = lib.status === 'ok' ? 'ok' : (lib.status === 'missing' ? 'missing' : 'extra');
        const isLocal = lib.configured_version === 'local';
        const badgeClass = isLocal ? 'local' : statusClass;
        const statusText = isLocal ? 'local' : lib.status;

        return `<tr>
            <td><span class="lib-name">${escapeHtml(lib.name || lib.library)}</span></td>
            <td><span class="lib-version">${escapeHtml(lib.configured_version || '—')}</span></td>
            <td><span class="lib-version">${escapeHtml(lib.installed_version || '—')}</span></td>
            <td><span class="lib-badge ${badgeClass}">${escapeHtml(statusText)}</span></td>
        </tr>`;
    }).join('');
}

async function initLibsConfig(e) {
    if (e) e.preventDefault();
    if (!selectedAddon) return;

    const result = await executeCommand('libs.init', { addon: selectedAddon });
    if (result.success) {
        showToast('Config Created', `libs.json created with ${result.data?.library_count || 0} libraries`, 'success');
        refreshLibraries();
    } else {
        showToast('Error', result.error?.message || 'Failed to create config', 'error');
    }
}

async function syncLibraries(force = false) {
    if (!selectedAddon) return;

    const result = await executeCommand('libs.sync', { addon: selectedAddon, force });
    if (result.success) {
        const data = result.data || {};
        const copied = data.copied || 0;
        const updated = data.updated || 0;
        const skipped = data.skipped || 0;
        const errors = data.errors || 0;

        const message = [];
        if (copied > 0) message.push(`${copied} copied`);
        if (updated > 0) message.push(`${updated} updated`);
        if (skipped > 0) message.push(`${skipped} skipped`);
        if (errors > 0) message.push(`${errors} errors`);

        showToast('Sync Complete', message.join(', ') || 'No changes', errors > 0 ? 'warning' : 'success');
        refreshLibraries();
    } else {
        showToast('Sync Failed', result.error?.message || 'Failed to sync libraries', 'error');
    }
}

// ═══════════════════════════════════════════════════════════════════════════
// SETTINGS VIEW
// ═══════════════════════════════════════════════════════════════════════════
async function refreshSettings() {
    loadServerInfo();
    const result = await executeCommand('env.status', {});

    if (result.success && result.data) {
        const data = result.data;

        document.getElementById('settings-wow-root').textContent = data.wow_root ? '✓ Found' : '✗ Not found';
        document.getElementById('settings-wow-root').className = 'value ' + (data.wow_root ? 'success' : 'error');
        document.getElementById('settings-dev-path').textContent = data.dev_path ? '✓ Found' : '✗ Not found';
        document.getElementById('settings-dev-path').className = 'value ' + (data.dev_path ? 'success' : 'error');
        document.getElementById('settings-wow-path-full').textContent = data.wow_root || 'Not configured';

        const flavors = Array.isArray(data.flavors) ? data.flavors.filter(f => f && typeof f === 'object') : [];
        document.getElementById('settings-flavors').innerHTML = flavors.length > 0
            ? flavors.map(f => `<span class="flavor-badge ${f.exists ? 'active' : 'inactive'}">${f.exists ? '✓' : '✗'} ${escapeHtml(f.name)}</span>`).join('')
            : '<span class="flavor-badge inactive">No clients detected</span>';

        document.getElementById('settings-data-dir').textContent = data.data_dir || '~/.mechanic';
    }

    const toolResult = await executeCommand('tools.status', {});

    if (toolResult.success && toolResult.data) {
        // Tools are returned as an array, convert to lookup by name
        const toolsArray = toolResult.data.tools || [];
        const toolsByName = {};
        toolsArray.forEach(t => { toolsByName[t.name] = t; });

        const updateTool = (id, tool) => {
            const el = document.getElementById(id);
            if (tool?.installed) {
                el.textContent = tool.version || '✓ Found';
                el.className = 'value success';
            } else {
                el.textContent = '✗ Not found';
                el.className = 'value error';
            }
        };

        updateTool('settings-luacheck', toolsByName.luacheck);
        updateTool('settings-stylua', toolsByName.stylua);
        updateTool('settings-lua', toolsByName.lua);
        updateTool('settings-busted', toolsByName.busted);
    }

    renderAddonList();
}

function renderAddonList() {
    const addonListEl = document.getElementById('settings-addon-list');
    const addonNames = Object.keys(knownAddons);
    if (addonNames.length === 0) {
        const empty = document.createElement('div');
        empty.className = 'addon-list-empty';
        empty.textContent = 'No addons registered. Click + in the sidebar to add one.';
        addonListEl.replaceChildren(empty);
        return;
    }
    addonListEl.replaceChildren(...addonNames.map(name => {
        const item = document.createElement('div');
        item.className = 'addon-list-item';
        const info = document.createElement('div');
        const nameEl = document.createElement('div');
        nameEl.className = 'addon-name';
        nameEl.textContent = name;
        const pathEl = document.createElement('div');
        pathEl.className = 'addon-path';
        pathEl.textContent = knownAddons[name];
        pathEl.title = knownAddons[name];
        info.append(nameEl, pathEl);
        const remove = document.createElement('button');
        remove.type = 'button';
        remove.className = 'btn-remove';
        remove.title = 'Remove addon';
        remove.setAttribute('aria-label', `Remove ${name}`);
        remove.textContent = '🗑️';
        remove.addEventListener('click', () => removeAddon(name));
        item.append(info, remove);
        return item;
    }));
}

function removeAddon(addonName) {
    if (!confirm(`Remove "${addonName}" from registered addons?`)) return;

    delete knownAddons[addonName];
    localStorage.setItem('mechanic.addons', JSON.stringify(knownAddons));
    if (selectedAddon === addonName) {
        selectedAddon = '';
        localStorage.removeItem('mechanic.selectedAddon');
    }
    updateAddonList();
    renderAddonList();
    showToast('Addon Removed', `${addonName} has been removed`, 'success');
}

// ═══════════════════════════════════════════════════════════════════════════
// COMMAND RESULT VIEW
// ═══════════════════════════════════════════════════════════════════════════
function displayCurrentResult() {
    if (!currentCommand) return;

    const history = commandHistory[currentCommand] || [];
    const idx = historyIndex[currentCommand] ?? -1;

    if (history.length === 0 || idx < 0) {
        cmdNoResult.style.display = 'block';
        cmdResult.style.display = 'none';
        cmdStatus.textContent = '—';
        cmdTime.textContent = '—';
        historyInfo.textContent = 'No runs';
        btnPrev.disabled = true;
        btnNext.disabled = true;
        return;
    }

    cmdNoResult.style.display = 'none';
    cmdResult.style.display = 'block';

    const entry = history[idx];
    const result = entry.result;

    cmdStatus.textContent = result.success ? '✓ Success' : '✗ Error';
    cmdStatus.className = 'result-status ' + (result.success ? 'success' : 'error');
    cmdTime.textContent = new Date(entry.timestamp).toLocaleTimeString();

    historyInfo.textContent = `${idx + 1} / ${history.length}`;
    btnPrev.disabled = idx <= 0;
    btnNext.disabled = idx >= history.length - 1;

    document.getElementById('result-reasoning').textContent = result.reasoning || result.error?.message || '—';

    const pct = result.confidence != null ? Math.round(result.confidence * 100) : 0;
    document.getElementById('confidence-fill').style.width = `${pct}%`;
    document.getElementById('confidence-text').textContent = result.confidence != null ? `${pct}%` : '—';

    const sourceList = document.getElementById('source-list');
    const sources = Array.isArray(result.sources) ? result.sources.filter(s => s && typeof s === 'object') : [];
    if (sources.length > 0) {
        sourceList.innerHTML = sources.map(s =>
            `<li class="source-item"><span>📄</span> ${escapeHtml(s.title || s.location || s.id)}</li>`
        ).join('');
    } else {
        sourceList.innerHTML = '<li class="source-item source-none">No sources</li>';
    }

    document.getElementById('result-data').textContent = result.data
        ? JSON.stringify(result.data, null, 2)
        : (result.error ? JSON.stringify(result.error, null, 2) : '// No data');
}

// ═══════════════════════════════════════════════════════════════════════════
// SANDBOX
// ═══════════════════════════════════════════════════════════════════════════
async function refreshSandboxStubs() {
    const statusEl = document.getElementById('sandbox-stubs-status');
    const totalEl = document.getElementById('sandbox-stubs-total');
    const protectedEl = document.getElementById('sandbox-stubs-protected');
    const normalEl = document.getElementById('sandbox-stubs-normal');

    const result = await executeCommand('sandbox.status', {});

    if (result.success && result.data) {
        const data = result.data;
        if (data.stubs_exist) {
            statusEl.textContent = 'Ready';
            statusEl.className = 'value success';
            totalEl.textContent = data.stubs_generated || '—';
            protectedEl.textContent = data.protected_count || '—';
            normalEl.textContent = data.normal_count || '—';
        } else {
            statusEl.textContent = 'Not Generated';
            statusEl.className = 'value warning';
            totalEl.textContent = '—';
            protectedEl.textContent = '—';
            normalEl.textContent = '—';
        }
    } else {
        statusEl.textContent = 'Error';
        statusEl.className = 'value error';
    }
}

async function generateSandboxStubs() {
    const btn = document.getElementById('btn-sandbox-generate');
    const statusEl = document.getElementById('sandbox-stubs-status');
    const totalEl = document.getElementById('sandbox-stubs-total');
    const protectedEl = document.getElementById('sandbox-stubs-protected');
    const normalEl = document.getElementById('sandbox-stubs-normal');

    btn.classList.add('loading');
    statusEl.textContent = 'Generating...';
    statusEl.className = 'value warning';

    const result = await executeCommand('sandbox.generate', {});

    if (result.success) {
        showToast('Stubs Generated', result.reasoning, 'success');
        const data = result.data || {};
        statusEl.textContent = 'Ready';
        statusEl.className = 'value success';
        totalEl.textContent = data.stubs_generated || '—';
        protectedEl.textContent = data.protected_count || '—';
        normalEl.textContent = data.normal_count || '—';
    } else {
        showToast('Generation Failed', result.error?.message || 'Unknown error', 'error');
        statusEl.textContent = 'Error';
        statusEl.className = 'value error';
    }

    btn.classList.remove('loading');
}

async function runSandboxTests() {
    if (!selectedAddon) {
        showToast('No Addon', 'Select an addon in the sidebar first', 'error');
        return;
    }

    const btn = document.getElementById('btn-sandbox-run');
    const resultsEl = document.getElementById('sandbox-results');

    btn.classList.add('loading');
    btn.textContent = 'Running...';

    resultsEl.innerHTML = '<div class="empty-note">Running sandbox tests...</div>';

    const result = await executeCommand('sandbox.test', { addon: selectedAddon });

    if (result.success) {
        showSandboxResults(result.data);
        showToast('Tests Complete', `${result.data.passed_count} passed, ${result.data.failed_count} failed`, result.data.passed ? 'success' : 'error');
    } else {
        resultsEl.innerHTML = `<div class="empty-note error">${escapeHtml(result.error?.message || 'Failed to run tests')}</div>`;
        showToast('Test Failed', result.error?.message || 'Unknown error', 'error');
    }

    btn.classList.remove('loading');
    btn.textContent = '▶ Run Tests';
}

function showSandboxResults(data) {
    document.getElementById('sandbox-passed').textContent = data.passed_count;
    document.getElementById('sandbox-failed').textContent = data.failed_count;
    document.getElementById('sandbox-addon').textContent = data.addon;

    const duration = Number.isFinite(Number(data.duration_ms)) && data.duration_ms
        ? ` in ${Number(data.duration_ms).toFixed(0)}ms`
        : '';
    document.getElementById('sandbox-summary').textContent = `${data.passed_count} / ${data.total} passed${duration}`;
    document.getElementById('sandbox-results').innerHTML = renderSandboxResults(data);
}

// ═══════════════════════════════════════════════════════════════════════════
// ADDON OUTPUT PANE
// ═══════════════════════════════════════════════════════════════════════════
function clearOutputPane(message) {
    outputData = { errors: [], tests: [], console: [], timestamp: null };
    document.getElementById('output-error-count').textContent = '0';
    document.getElementById('output-test-count').textContent = '0/0';
    document.getElementById('output-console-count').textContent = '0';
    document.getElementById('output-error-tree').textContent = message;
    document.getElementById('output-addon-tests-container').replaceChildren();
    document.getElementById('output-console-entries').textContent = message;
    document.getElementById('output-libraries-row').replaceChildren();
}

// Update the output pane from an addon.output result
function updateOutputPane(data) {
    document.getElementById('output-reload-time').textContent = data.timestamp || new Date().toLocaleTimeString();

    document.getElementById('output-error-count').textContent = data.error_count || 0;
    document.getElementById('output-console-count').textContent = data.console_count || 0;
    const tests = Array.isArray(data.tests) ? data.tests.filter(t => t && typeof t === 'object') : [];
    document.getElementById('output-test-count').textContent = `${tests.filter(t => t.passed).length}/${tests.length}`;

    outputData = data;

    if (data.libraries) renderLibraryRow(data.libraries);
    if (data.errors) document.getElementById('output-error-tree').innerHTML = renderErrorTree(data.errors);
    if (data.tests) {
        document.getElementById('output-addon-tests-container').innerHTML = renderTestBadges(data.tests, data.perf);
    }
    if (data.console) renderConsolePane();
}

function renderLibraryRow(libraries) {
    const container = document.getElementById('output-libraries-row');
    const html = renderLibraryTags(libraries);
    container.style.display = html ? 'flex' : 'none';
    container.innerHTML = html;
}

function renderConsolePane() {
    const entries = outputData.console;
    document.getElementById('output-console-entries').innerHTML = renderConsoleLog(entries, consoleFilter);
    if (Array.isArray(entries) && entries.length > 0) {
        document.getElementById('output-console-count').textContent = entries.length;
    }
}

// Reload broadcasts are invalidations. Always re-read the selected target so an
// ambiguous watcher payload cannot mix profiles in the dashboard.
function updateTestResults(msg) {
    if (!selectedDiagnosticTarget) return;
    const payloadTarget = msg.target || msg.data?.target;
    if (payloadTarget && !targetsMatch(targetSelector(payloadTarget), selectedDiagnosticTarget)) return;
    fetchAddonOutput();
}
