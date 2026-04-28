#!/usr/bin/env bash
set -euo pipefail

MODEL="${1:-ollama_chat/codegeex4:9b}"
PROJECT_DIR="${2:-$PWD}"
AIDER_BIN="${AIDER_BIN:-$HOME/.local/bin/aider}"
OLLAMA_API_BASE="${OLLAMA_API_BASE:-http://127.0.0.1:11434}"

if [[ ! -x "$AIDER_BIN" ]]; then
  echo "Aider binary not found: $AIDER_BIN" >&2
  exit 1
fi

if [[ ! -d "$PROJECT_DIR" ]]; then
  echo "Project directory not found: $PROJECT_DIR" >&2
  exit 1
fi

cd "$PROJECT_DIR"
export OLLAMA_API_BASE

exec "$AIDER_BIN" --model "$MODEL"

