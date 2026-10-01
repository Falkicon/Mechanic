// WebSocket connection with capped exponential backoff.
const WS_RECONNECT_BASE_DELAY = 1000;
const WS_RECONNECT_MAX_DELAY = 30000;
let ws = null;
let wsReconnectTimer = null;
let wsReconnectAttempts = 0;
let wsHasOpened = false;
let pageUnloading = false;

function scheduleWebSocketReconnect() {
    if (pageUnloading || wsReconnectTimer !== null) return;

    const delay = Math.min(
        WS_RECONNECT_BASE_DELAY * (2 ** wsReconnectAttempts),
        WS_RECONNECT_MAX_DELAY
    );
    wsReconnectAttempts += 1;
    wsReconnectTimer = setTimeout(() => {
        wsReconnectTimer = null;
        connectWebSocket();
    }, delay);
}

function connectWebSocket() {
    if (pageUnloading || (ws && (
        ws.readyState === WebSocket.CONNECTING ||
        ws.readyState === WebSocket.OPEN
    ))) return;

    const protocol = window.location.protocol === 'https:' ? 'wss:' : 'ws:';
    const socket = new WebSocket(`${protocol}//${window.location.host}/ws`);
    ws = socket;
    socket.onopen = () => {
        wsReconnectAttempts = 0;
        statusDot.className = 'status-dot connected';
        statusText.textContent = 'Connected';
        // Reload broadcasts sent while disconnected were missed: re-read the output.
        if (wsHasOpened && selectedDiagnosticTarget) fetchAddonOutput();
        wsHasOpened = true;
    };
    socket.onclose = () => {
        if (socket !== ws) return;
        statusDot.className = 'status-dot disconnected';
        statusText.textContent = 'Disconnected';
        scheduleWebSocketReconnect();
    };
    socket.onmessage = (event) => {
        let msg;
        try {
            msg = JSON.parse(event.data);
        } catch (e) {
            return;
        }
        if (!msg || typeof msg !== 'object' || Array.isArray(msg)) return;

        if (msg.type === 'reload') updateTestResults(msg);
        if (msg.type === 'command_result') {
            if (typeof msg.command !== 'string' || !msg.result ||
                typeof msg.result !== 'object' || Array.isArray(msg.result)) return;
            // Command ran from external source (agent, CLI)
            addToHistory(msg.command, msg.result);
            showToast(msg.command, msg.result.reasoning || 'Completed', msg.result.success ? 'success' : 'error');
            if (currentCommand === msg.command) {
                historyIndex[currentCommand] = commandHistory[currentCommand].length - 1;
                displayCurrentResult();
            }
        }
    };
}

function closeWebSocketOnPageHide() {
    pageUnloading = true;
    if (wsReconnectTimer !== null) {
        clearTimeout(wsReconnectTimer);
        wsReconnectTimer = null;
    }
    if (ws && typeof ws.close === 'function') ws.close();
}

// pagehide replaces the deprecated unload event. A page restored from the
// back/forward cache gets a fresh connection and a fresh read.
function reconnectWebSocketOnPageShow(event) {
    if (!event || !event.persisted) return;
    pageUnloading = false;
    wsReconnectAttempts = 0;
    connectWebSocket();
}

window.addEventListener('pagehide', closeWebSocketOnPageHide);
window.addEventListener('pageshow', reconnectWebSocketOnPageShow);
connectWebSocket();
