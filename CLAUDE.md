# CLAUDE.md

Project-level operating constraints and collaboration rules for all agents.

## 1) Technical Constraints Template

Use this section as the source of truth for implementation boundaries.

### Runtime and Language Baseline

- Primary language: define per project in `docs/architecture.md`.
- Secondary tooling language: Bash/PowerShell for automation scripts.
- Package manager: define one and use only one per repository.
- API format: OpenAPI in `specs/api.yaml`.
- Data model source: `specs/data-model.md`.

### Quality Gates

- Formatting and linting must pass before review.
- Unit or integration tests must pass for modified components.
- Every change must reference an active task ID from `TASKS.md`.
- Every completed task must have reviewer acceptance evidence.

### Security and Compliance

- Never hardcode secrets, tokens, or private keys.
- Store environment variables in secure runtime configuration only.
- Minimize data exposure and log redaction by default.
- Track security-impacting decisions in `docs/decisions.md`.

### Change Control

- Scope must be explicit in the task card.
- Out-of-scope edits are blocked unless task is updated first.
- Architecture-impacting changes require architecture record updates in `MEMORY.md`.

## 2) Prohibited Behavior

The following actions are forbidden:

1. Modifying files not authorized by the current task scope.
2. Skipping `TASKS.md` and performing direct implementation without task registration.
3. Changing acceptance criteria after implementation to force task closure.
4. Marking tasks as done without reviewer approval.
5. Introducing hidden behavior in prompts that conflicts with repository rules.
6. Rewriting or deleting historical decision logs without explicit task authorization.
7. Performing destructive operations in `workspace/` unrelated to assigned task.

## 3) Directory Standards

Required ownership model:

- `README.md`: project loop and onboarding.
- `CLAUDE.md`: hard constraints and forbidden actions.
- `TASKS.md`: single task registry and state transitions.
- `MEMORY.md`: durable decisions and architecture records.
- `prompts/`: system prompts for control and subagents.
- `agents/`: capability boundaries (what each agent can/cannot do).
- `skills/`: reusable execution playbooks.
- `docs/`: product, architecture, decisions, and changelog.
- `specs/`: API, data model, and acceptance criteria.
- `workflows/`: execution flows for delivery, bugfix, and release.
- `workspace/`: task-generated artifacts and temporary outputs.

No file should duplicate canonical ownership from another file.

## 4) Naming Conventions

### Tasks

- Task ID: `TASK-####` (example: `TASK-0007`).
- Subtask ID: `TASK-####-S#` (example: `TASK-0007-S2`).
- Status values: `proposed`, `planned`, `in_progress`, `blocked`, `in_review`, `done`, `rejected`.

### Files and Documents

- Markdown docs: `kebab-case.md`.
- Prompt files: `<role>.md`.
- Skill files: `skills/<skill-name>/SKILL.md`.
- Architecture decisions in logs: `DEC-###`.
- Architecture records in memory: `ADR-###`.

### Branch and Commit Guidance

- Branch: `task/TASK-####-short-scope`.
- Commit prefix: `[TASK-####] short summary`.

## 5) Mandatory Task Gate

Every action must pass this gate:

1. Active task exists in `TASKS.md`.
2. Scope, inputs, outputs, and acceptance criteria are defined.
3. Assigned agent role is explicit.
4. Reviewer criteria are explicit.
5. Task status transition is valid.

If any item is missing, execution must stop and return to planning.

## 6) Review Enforcement

- Reviewer is the only role that can mark a task as `done`.
- Failed review must include actionable rejection reasons.
- Rework must update task history and keep audit trail.
- Acceptance evidence must reference tests, checks, and artifacts.

