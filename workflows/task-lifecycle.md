# Task Lifecycle Workflow

## Purpose

Define the end-to-end lifecycle for all tasks in a task-first agent project.

## Lifecycle States

`proposed -> planned -> in_progress -> in_review -> done`

Fallback states:

- `blocked` from `planned` or `in_progress`
- `rejected` from `in_review`

## Workflow Steps

1. Intake:
   - Main agent receives user goal.
   - Planner prepares task card draft.
2. Registration:
   - Task card is added to `TASKS.md` with status `proposed`.
3. Planning approval:
   - Main agent validates scope and acceptance, set status `planned`.
4. Execution:
   - Main agent dispatches one subagent.
   - Task moves to `in_progress`.
5. Delivery:
   - Implementer provides outputs and evidence.
   - Task moves to `in_review`.
6. Review:
   - Reviewer checks criteria and evidence.
   - If pass: status `done`.
   - If fail: status `rejected` with rework notes.
7. Rework loop:
   - Rejected tasks return to `in_progress` after fix plan.

## Control Rules

1. No direct transition to `done` without review.
2. Any scope change requires task update before execution continues.
3. Blocked tasks must include explicit blocker and owner.
4. Every transition must append execution log entry.

