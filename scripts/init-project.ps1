param(
  [Parameter(Mandatory = $true)]
  [string]$ProjectName
)

$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Force -Path "docs","specs","workflows","agents","prompts","skills","workspace","n8n","n8n/workflows" | Out-Null
New-Item -ItemType File -Force -Path "workspace/.gitkeep" | Out-Null

if (-not (Test-Path ".env.example")) {
@"
N8N_BASE_URL=http://localhost:5678
AGENT_RUNNER_MODE=local
TRACE_ENABLED=true
"@ | Set-Content -LiteralPath ".env.example" -Encoding utf8
}

@"
# $ProjectName Profile (v0.12)

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
"@ | Set-Content -LiteralPath "docs/project-profile.md" -Encoding utf8

Write-Host "Initialized $ProjectName with agent-build v0.12"
