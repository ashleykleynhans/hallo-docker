#!/usr/bin/env bash

echo "Starting hallo"
source /venv/bin/activate
cd /workspace/hallo
TCMALLOC="$(ldconfig -p | grep -Po "libtcmalloc.so.\d" | head -n 1)"
export PYTHONUNBUFFERED=1
export LD_PRELOAD="${TCMALLOC}"
export GRADIO_SERVER_NAME="0.0.0.0"
export GRADIO_SERVER_PORT="3001"
nohup python3 scripts/app.py > /workspace/logs/hallo.log 2>&1 &
echo "hallo started"
echo "Log file: /workspace/logs/hallo.log"
deactivate
