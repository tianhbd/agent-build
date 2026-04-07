# Release Workflow

## Purpose

Provide a controlled release path for task-driven agent projects.

## Release Preconditions

1. Release-scope tasks are all `done`.
2. Every `done` task has reviewer acceptance evidence.
3. Decision and architecture records are up to date.
4. Changelog entry is prepared.

## Steps

1. Scope Freeze
   - Main agent defines release task set.
   - No new scope added without explicit release decision.

2. Validation
   - Verify acceptance checklist in `specs/acceptance.md`.
   - Run required tests/checks.

3. Review Gate
   - Reviewer confirms release readiness.
   - Any failed criterion blocks release.

4. Documentation Sync
   - Update `docs/changelog.md`.
   - Ensure specs and architecture docs match shipped behavior.

5. Release Mark
   - Tag or mark release version.
   - Record release decision in `docs/decisions.md` if policy-impacting.

## Rollback Rules

1. Define rollback trigger conditions before release mark.
2. Keep previous stable version reference.
3. If critical issue occurs, create immediate bugfix task and move to bugfix workflow.

