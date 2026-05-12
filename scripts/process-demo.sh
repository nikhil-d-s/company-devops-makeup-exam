#!/usr/bin/env bash
set -euo pipefail

sleep 300 &
child_pid=$!
ps -o pid,ppid,cmd -p "${child_pid}" --forest
kill "${child_pid}"
wait "${child_pid}" 2>/dev/null || true
