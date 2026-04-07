#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="${1:-}"
if [[ -z "${PROJECT_NAME}" ]]; then
  echo "Usage: ./scripts/init-project.sh <project-name>"
  exit 1
fi

mkdir -p docs specs workflows agents prompts skills workspace n8n n8n/workflows

touch workspace/.gitkeep

if [[ ! -f .env.example ]]; then
  cat > .env.example <<'EOF'
N8N_BASE_URL=http://localhost:5678
AGENT_RUNNER_MODE=local
TRACE_ENABLED=true
EOF
fi

cat > docs/project-profile.md <<EOF
# ${PROJECT_NAME} Profile (v0.12)

## Goal

## Input

## Output

## n8n Stages

1. script-agent
2. tts-agent
3. storyboard-agent
4. asset-agent
5. editor-agent
6. review-agent
EOF

echo "Initialized ${PROJECT_NAME} with agent-build v0.12"
