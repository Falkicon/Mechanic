// Event wiring and startup. main.js calls init() once every script has loaded.

function toggleDisclosure(trigger) {
    const expandId = trigger.dataset.toggle;
    const collapseId = trigger.dataset.collapse;
    const target = document.getElementById(expandId || collapseId);
    if (!target) return;
    if (expandId) {
        const expanded = target.classList.toggle('expanded');
        trigger.classList.toggle('expanded', expanded);
        trigger.setAttribute('aria-expanded', String(expanded));
    } else {
        const collapsed = target.classList.toggle('collapsed');
        trigger.setAttribute('aria-expanded', String(!collapsed));
    }
}

// Disclosure headers are real buttons with data-toggle / data-collapse attributes;
// one delegated listener serves both static and rendered headers.
document.addEventListener('click', (event) => {
    const source = event.target;
    const trigger = source && typeof source.closest === 'function'
        ? source.closest('[data-toggle],[data-collapse]')
        : null;
    if (trigger) toggleDisclosure(trigger);
});

mechanicTab.onclick = () => showView('mechanic');
sandboxTab.onclick = () => showView('sandbox');

commandPicker.onchange = () => {
    if (commandPicker.value) navigateToCommand(commandPicker.value);
};
diagnosticTargetSelect.onchange = () => {
    const index = Number.parseInt(diagnosticTargetSelect.value, 10);
    selectedDiagnosticTarget = Number.isInteger(index) && diagnosticTargets[index]
        ? targetSelector(diagnosticTargets[index])
        : null;
    if (selectedDiagnosticTarget) {
        localStorage.setItem('mechanic.diagnosticTarget', JSON.stringify(selectedDiagnosticTarget));
        targetStatus.textContent = 'Explicit target selected';
    } else {
        localStorage.removeItem('mechanic.diagnosticTarget');
        targetStatus.textContent = 'No target selected';
    }
    clearOutputPane(selectedDiagnosticTarget
        ? 'Loading output for the selected target…'
        : 'Select a diagnostic target to load addon output.');
    if (currentCommand && commandCatalog.has(currentCommand)) renderCommandInput(currentCommand);
    if (selectedDiagnosticTarget) fetchAddonOutput();
};
btnFormMode.onclick = () => setCommandInputMode('form');
btnRawMode.onclick = () => setCommandInputMode('raw');

btnPrev.onclick = () => {
    if (!currentCommand || !commandHistory[currentCommand]) return;
    historyIndex[currentCommand] = Math.max(0, (historyIndex[currentCommand] ?? 0) - 1);
    displayCurrentResult();
};
btnNext.onclick = () => {
    if (!currentCommand || !commandHistory[currentCommand]) return;
    const max = commandHistory[currentCommand].length - 1;
    historyIndex[currentCommand] = Math.min(max, (historyIndex[currentCommand] ?? 0) + 1);
    displayCurrentResult();
};

btnRunCmd.onclick = async () => {
    if (currentCommand && !btnRunCmd.classList.contains('loading')) {
        try {
            const parsed = getCurrentCommandInput();
            if (parsed.errors.length) {
                showCommandInputErrors(parsed.errors);
                showToast('Input Error', parsed.errors[0], 'error');
                return;
            }
            const input = parsed.value;
            consoleInput.value = JSON.stringify(input);
            showCommandInputErrors([]);

            btnRunCmd.classList.add('loading');
            await executeCommand(currentCommand, input);
            btnRunCmd.classList.remove('loading');
        } catch (e) {
            showToast('Input Error', e.message || 'Invalid command input', 'error');
            btnRunCmd.classList.remove('loading');
        }
    }
};

document.getElementById('btn-clear-history').onclick = () => {
    if (currentCommand && confirm(`Clear all history for ${currentCommand}?`)) {
        clearHistory(currentCommand);
    }
};

document.getElementById('btn-lib-refresh').onclick = () => refreshLibraries();
document.getElementById('btn-lib-sync').onclick = () => syncLibraries(false);
document.getElementById('btn-lib-force-sync').onclick = () => syncLibraries(true);

document.getElementById('btn-settings-refresh').onclick = () => refreshSettings();
document.getElementById('btn-settings-add-addon').onclick = () => addAddon().then(() => renderAddonList());

addonSelect.onchange = () => {
    selectedAddon = addonSelect.value;
    localStorage.setItem('mechanic.selectedAddon', selectedAddon);
    updateAddonStatus();
};

document.getElementById('btn-create-nav').onclick = () => navigateToCommand('addon.create');
const showReloadInstructions = () => showToast('Reload WoW', 'Run /reload in WoW, then wait for Mechanic to sync the results.', 'success');
document.getElementById('btn-reload').onclick = showReloadInstructions;
document.getElementById('btn-stop').onclick = () => {
    if (confirm('Stop the Mechanic server?')) executeCommand('server.shutdown');
};
document.getElementById('btn-settings').onclick = () => showView('settings');

document.getElementById('btn-sandbox-run').onclick = () => runSandboxTests();
document.getElementById('btn-sandbox-generate').onclick = () => generateSandboxStubs();

document.getElementById('btn-get-started').onclick = () => addAddon();
document.getElementById('btn-add-addon').onclick = () => addAddon();

document.getElementById('btn-execute').onclick = async () => {
    const cmd = consoleCmd.value.trim();
    try {
        const input = JSON.parse(consoleInput.value.trim() || '{}');
        await executeCommand(cmd, input);
    } catch (err) {
        consoleOutput.textContent = `Parse error: ${err.message}`;
    }
};

// Shortcuts are plain keys only: never hijack Ctrl/Cmd/Alt combinations such as
// Ctrl+V or Ctrl+R, nor typing in editable fields.
function isEditableTarget(target) {
    if (!target) return false;
    return target.tagName === 'INPUT' || target.tagName === 'TEXTAREA' ||
        target.tagName === 'SELECT' || target.isContentEditable === true;
}

document.addEventListener('keydown', (e) => {
    if (e.ctrlKey || e.metaKey || e.altKey || isEditableTarget(e.target)) return;
    switch (String(e.key).toLowerCase()) {
        case 'r': showReloadInstructions(); break;
        case 'v': navigateToCommand('addon.validate'); break;
        case ':': e.preventDefault(); consoleCmd.focus(); break;
    }
});

document.querySelectorAll('.console-filter').forEach(btn => {
    btn.addEventListener('click', () => {
        document.querySelectorAll('.console-filter').forEach(b => {
            b.classList.remove('active');
            b.setAttribute('aria-pressed', 'false');
        });
        btn.classList.add('active');
        btn.setAttribute('aria-pressed', 'true');
        consoleFilter = btn.dataset.filter;
        if (outputData.console) renderConsolePane();
    });
});

document.getElementById('btn-copy-output')?.addEventListener('click', async () => {
    if (!selectedDiagnosticTarget) {
        showToast('Target required', 'Select a diagnostic target before copying output.', 'error');
        return;
    }
    try {
        const result = await postExecute('addon.output', { agent_mode: true, target: selectedDiagnosticTarget });
        if (result.success && result.data?.output) {
            await navigator.clipboard.writeText(result.data.output);
            showToast('Copied!', 'Agent-optimized output copied to clipboard', 'success');
        } else {
            showToast('Nothing to copy', result?.error?.message || 'The selected target returned no output.', 'error');
        }
    } catch (e) {
        showToast('Error', 'Failed to copy output', 'error');
    }
});

async function init() {
    setInterval(() => {
        const seconds = Math.floor((Date.now() - startTime) / 1000);
        const mins = Math.floor(seconds / 60);
        uptimeEl.textContent = mins > 0 ? `${mins}m ${seconds % 60}s` : `${seconds}s`;
    }, 1000);

    // Sidebar buttons render immediately; the catalog then filters them and adds
    // schemas and mutation flags. Catalog and target discovery are metadata reads:
    // loading the page does not execute the selected command or any mutating action.
    renderSidebar();
    await Promise.all([loadCommandCatalog(), loadDiagnosticTargets(), loadServerInfo()]);
    accountsInfo.textContent = 'Accounts: use diagnostic target selector';

    // A target restored from the previous session has no output until we read it.
    if (selectedDiagnosticTarget) fetchAddonOutput();

    await loadHistory();

    const lastView = localStorage.getItem('mechanic.activeView') || 'mechanic';
    const lastCommand = localStorage.getItem('mechanic.activeCommand');
    const lastAddon = localStorage.getItem('mechanic.selectedAddon');

    if (lastAddon) {
        selectedAddon = lastAddon;
    }
    updateAddonList();

    if (lastView === 'command' && lastCommand) {
        navigateToCommand(lastCommand);
    } else if (['mechanic', 'libraries', 'settings', 'sandbox'].includes(lastView)) {
        showView(lastView, false);
    } else {
        showView('mechanic', false);
    }
}
