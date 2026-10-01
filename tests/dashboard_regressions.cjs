const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { createDashboard, MechanicSchemaForm, scriptFiles, html, dashboardDir } = require('./dashboard_harness.cjs');

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
  dashboard.eventListeners.get('pagehide')();
  assert.equal(dashboard.timers.size, 0);
  assert.equal(dashboard.timers.has(reconnectTimerId), false);
  assert.equal(dashboard.sockets.length, 1);
  assert.equal(dashboard.sockets[0].readyState, 3, 'pagehide closes the socket');
  assert.equal(dashboard.eventListeners.has('unload'), false, 'the deprecated unload event is not used');
}

console.log('dashboard regressions passed');

module.exports = { createDashboard, MechanicSchemaForm };
