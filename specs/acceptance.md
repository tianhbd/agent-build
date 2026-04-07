# Acceptance Specification

Defines mandatory acceptance checks for tasks and releases.

## Global Acceptance Rules

1. Every change maps to a valid `TASK-####` entry.
2. Task includes explicit inputs, outputs, scope, and acceptance criteria.
3. Task status transitions are valid and logged.
4. Reviewer provides evidence-based `accept` decision before `done`.
5. Constraints in `CLAUDE.md` are not violated.

## Task-Level Acceptance Checklist

For each task, reviewer must confirm:

1. Scope compliance:
   - Only authorized files or artifacts were changed.
2. Requirement coverage:
   - Each acceptance criterion is matched by evidence.
3. Quality checks:
   - Tests/checks defined by task pass.
4. Documentation updates:
   - Relevant docs/specs/memory updated when required.
5. Risk handling:
   - Known risks and follow-ups are documented.

## Review Decision Matrix

| Condition | Decision |
|---|---|
| All criteria passed with evidence | accept |
| Any required criterion failed | reject |
| Missing required evidence | reject |
| Scope violation found | reject |

## Release Readiness Checklist

1. No `in_progress`, `blocked`, or `rejected` tasks in release scope.
2. All release tasks are `done` with review evidence.
3. Changelog includes release content summary.
4. API and data model docs reflect shipped behavior.
5. Critical regression checks are green.

## Evidence Format

Each acceptance item should provide:

- Criterion text.
- Evidence source (test output, artifact, or file diff summary).
- Pass/fail decision.
- Reviewer comment when failed.

