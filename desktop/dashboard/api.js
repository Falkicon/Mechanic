// Network layer: command execution, catalog/target discovery, output and history.

async function postExecute(command, input = {}) {
    const response = await fetch('/api/execute', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ command, input })
    });
    return response.json();
}

function addToHistory(cmd, result) {
    if (!commandHistory[cmd]) commandHistory[cmd] = [];
    const entries = commandHistory[cmd];
    entries.push({
        result,
        timestamp: new Date().toISOString()
    });
    if (entries.length > MAX_HISTORY_PER_COMMAND) entries.splice(0, entries.length - MAX_HISTORY_PER_COMMAND);
    historyIndex[cmd] = entries.length - 1;
}

async function executeCommand(command, input = {}) {
    try {
        const result = await postExecute(command, input);

        addToHistory(command, result);
        consoleOutput.textContent = JSON.stringify(result, null, 2);

        // Update view if we're looking at this command
        if (currentCommand === command) {
            displayCurrentResult();
        }

        return result;
    } catch (err) {
        consoleOutput.textContent = `Error: ${err.message}`;
        return { success: false, error: { message: err.message } };
    }
}

async function loadCommandCatalog() {
    try {
        const result = await postExecute('commands.list', {});
        const commands = result && result.success && Array.isArray(result.data?.commands)
            ? result.data.commands
            : null;
        if (!commands) throw new Error(result?.error?.message || 'Catalog response was invalid');
        installCommandCatalog(commands);
    } catch (error) {
        commandCatalog = new Map();
        commandPicker.replaceChildren();
        const option = document.createElement('option');
        option.value = '';
        option.textContent = 'Catalog unavailable';
        commandPicker.appendChild(option);
        catalogStatus.textContent = 'Use the raw command console below.';
        renderSidebar();
    }
}

async function loadDiagnosticTargets() {
    try {
        const result = await postExecute('diagnostic.targets', {});
        if (!result?.success || !Array.isArray(result.data?.targets)) throw new Error('Target response was invalid');
        installDiagnosticTargets(result.data.targets);
    } catch (error) {
        diagnosticTargets = [];
        selectedDiagnosticTarget = null;
        targetStatus.textContent = 'Target discovery unavailable';
    }
}

// Version and port are optional: older servers only return { status }.
async function loadServerInfo() {
    let info = null;
    try {
        const response = await fetch('/health');
        info = await response.json();
    } catch (error) {
        info = null;
    }
    renderServerInfo(info);
}

// Fetch and render addon output for the selected target. Responses for a target
// that is no longer selected are ignored.
async function fetchAddonOutput() {
    if (!selectedDiagnosticTarget) {
        clearOutputPane('Select a diagnostic target to load addon output.');
        targetStatus.textContent = diagnosticTargets.length ? 'Choose a target to read diagnostics' : targetStatus.textContent;
        return;
    }
    const requestedTarget = { ...selectedDiagnosticTarget };
    try {
        const result = await postExecute('addon.output', { target: requestedTarget });
        if (!selectedDiagnosticTarget || !targetsMatch(requestedTarget, selectedDiagnosticTarget)) return;
        if (result.success && result.data) {
            updateOutputPane(result.data);
        } else {
            clearOutputPane(result?.error?.message || 'Could not load output for the selected target.');
        }
    } catch (e) {
        if (selectedDiagnosticTarget && targetsMatch(requestedTarget, selectedDiagnosticTarget)) {
            clearOutputPane(`Could not load output for the selected target: ${e.message}`);
        }
        console.log('Failed to fetch addon output:', e);
    }
}

// Load history from database
async function loadHistory() {
    try {
        const res = await fetch('/api/history?limit=100');
        const data = await res.json();
        if (data.history) {
            for (const entry of data.history) {
                const cmd = entry.command;
                if (!commandHistory[cmd]) commandHistory[cmd] = [];

                // Check for duplicates before adding
                const entryTime = new Date(entry.timestamp).getTime();
                const isDuplicate = commandHistory[cmd].some(existing =>
                    new Date(existing.timestamp).getTime() === entryTime
                );

                if (!isDuplicate) {
                    commandHistory[cmd].push({
                        result: entry.result,
                        timestamp: entry.timestamp
                    });
                }
            }
            // Keep the newest entries and point at the latest for each command
            for (const cmd in commandHistory) {
                const entries = commandHistory[cmd];
                if (entries.length > MAX_HISTORY_PER_COMMAND) entries.splice(0, entries.length - MAX_HISTORY_PER_COMMAND);
                historyIndex[cmd] = entries.length - 1;
            }
        }
    } catch (e) {
        console.log('Failed to load history:', e);
    }
}

async function clearHistory(command = null) {
    try {
        await fetch('/api/history/clear', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ command })
        });
        if (command) {
            commandHistory[command] = [];
            historyIndex[command] = -1;
        } else {
            for (const cmd in commandHistory) {
                commandHistory[cmd] = [];
                historyIndex[cmd] = -1;
            }
        }
        displayCurrentResult();
        showToast('History cleared', command || 'All commands', 'success');
    } catch (e) {
        console.log('Failed to clear history:', e);
        showToast('History not cleared', e.message || 'Request failed', 'error');
    }
}
