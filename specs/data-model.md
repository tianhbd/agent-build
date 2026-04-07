# Data Model Specification

## Overview

This model defines canonical entities for task-driven agent execution.

## Entity: Task

| Field | Type | Required | Description |
|---|---|---|---|
| id | string (`TASK-####`) | yes | Unique task identifier |
| title | string | yes | Human-readable task name |
| status | enum | yes | Task lifecycle state |
| owner_agent | enum | yes | Current responsible role |
| priority | enum (`P0..P3`) | yes | Delivery priority |
| dependencies | array[string] | no | Required predecessor tasks |
| input | object | yes | Inputs and constraints |
| output | object | no | Delivery artifacts summary |
| scope_in | array[string] | yes | Allowed work scope |
| scope_out | array[string] | yes | Explicit exclusions |
| acceptance_criteria | array[string] | yes | Reviewer validation basis |
| execution_log | array[object] | no | Status history and notes |
| review_result | object | no | Reviewer decision and evidence |
| created_at | datetime | yes | Creation timestamp |
| updated_at | datetime | yes | Last updated timestamp |

### Task Status Enum

- `proposed`
- `planned`
- `in_progress`
- `blocked`
- `in_review`
- `done`
- `rejected`

## Entity: DecisionRecord

| Field | Type | Required | Description |
|---|---|---|---|
| id | string (`DEC-###`) | yes | Decision ID |
| date | date | yes | Decision date |
| related_tasks | array[string] | yes | Related task IDs |
| category | enum | yes | product, architecture, process, security |
| decision | string | yes | Final decision |
| rationale | string | yes | Why it was selected |
| impact | string | yes | Expected impact |
| status | enum | yes | active or superseded |

## Entity: ArchitectureRecord

| Field | Type | Required | Description |
|---|---|---|---|
| id | string (`ADR-###`) | yes | Architecture record ID |
| date | date | yes | Record date |
| related_tasks | array[string] | yes | Related task IDs |
| problem | string | yes | Problem statement |
| constraints | array[string] | yes | Boundaries and requirements |
| decision | string | yes | Chosen architecture |
| validation_plan | array[string] | yes | Verification checks |
| rollback_plan | array[string] | yes | Recovery strategy |
| status | enum | yes | proposed, accepted, deprecated |

## Entity: ReviewResult

| Field | Type | Required | Description |
|---|---|---|---|
| task_id | string | yes | Reviewed task ID |
| reviewer | string | yes | Reviewer role or identity |
| decision | enum | yes | accept or reject |
| acceptance_matrix | array[object] | yes | Criterion-by-criterion decision |
| comments | string | no | Additional notes |
| reviewed_at | datetime | yes | Review timestamp |

## Relationship Notes

1. One `Task` can reference many `DecisionRecord` and `ArchitectureRecord` entries.
2. One `Task` has zero or one final `ReviewResult` per review cycle.
3. `done` status requires a corresponding `ReviewResult` with `decision=accept`.

