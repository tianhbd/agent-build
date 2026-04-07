# Architecture Overview

## Architecture Principles

1. Task-first orchestration over agent-first autonomy.
2. Single control loop through main agent.
3. Single-responsibility subagents.
4. Explicit file-based policy and decision records.
5. Reviewer-gated completion.

## Core Components

1. `main-agent` controller:
   - Owns loop control, task state transitions, and dispatch.
2. Subagents:
   - `planner`, `architect`, `coder`, `debugger`, `reviewer`.
3. Task registry:
   - `TASKS.md` as execution source of truth.
4. Memory system:
   - `MEMORY.md` and `docs/decisions.md`.
5. Policy layer:
   - `CLAUDE.md`, prompts, skills, workflows.
6. Spec layer:
   - `specs/api.yaml`, `specs/data-model.md`, `specs/acceptance.md`.
7. Artifact workspace:
   - `workspace/` for generated and transient artifacts.

## Control Flow

1. Intake user goal.
2. Plan and register tasks.
3. Dispatch one subtask to one role.
4. Execute scoped work.
5. Review against acceptance.
6. Update task status and memory.
7. Repeat until completion.

## Data and State

Primary states:

- Task lifecycle in `TASKS.md`.
- Decisions in `MEMORY.md` and `docs/decisions.md`.
- Requirements/design/code evidence in docs, specs, and workspace artifacts.

## Failure Handling

1. If acceptance fails, task returns to `in_progress` or `blocked`.
2. If constraints conflict, escalate to planner/architect and update task scope first.
3. If architecture risk is high, require ADR entry before implementation.

## Extension Model

1. Add subagent roles by adding:
   - `prompts/<role>.md`
   - `agents/<role>.md`
2. Add reusable capabilities via new `skills/<name>/SKILL.md`.
3. Add project-specific specifications under `specs/`.

