#!/bin/bash
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# Matches .github/workflows/validate-notebooks.yaml, which is the only
# repo-wide check: it validates every changed notebook with nbformat.
# Each example under examples/<topic>/ has its own requirements.txt for
# that example's dependencies and is installed on demand, not here.
pip install nbformat
