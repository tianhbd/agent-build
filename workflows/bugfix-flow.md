# Bugfix Workflow

## Purpose

Standard bugfix path with evidence-based debugging and reviewer gate.

## Steps

1. Report Intake
   - Capture bug symptoms, expected behavior, actual behavior, and logs.
   - Create or update task in `TASKS.md`.

2. Triage
   - Planner sets priority and impact.
   - Assign owner to debugger.

3. Reproduction
   - Debugger creates deterministic reproduction steps.
   - Task status becomes `in_progress`.

4. Root-Cause Analysis
   - Debugger documents hypotheses and confirms root cause.
   - If architecture impact exists, involve architect and record decision.

5. Fix Implementation
   - Coder applies minimal-scope fix under authorized files.
   - Add regression checks.

6. Review and Acceptance
   - Reviewer validates reproduction closure, fix correctness, and regression checks.
   - Accept: status `done`; Reject: status `rejected` with required rework.

## Bugfix Quality Rules

1. No bug closure without reproduced evidence.
2. No broad refactor hidden inside bugfix scope.
3. Regression risk must be explicitly evaluated.
4. Critical bugs require changelog entry.

