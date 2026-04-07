# TASKS.md

Single source of truth for all task execution.

## Task Policy

1. No execution without an active task entry.
2. Status must follow valid transitions.
3. Scope, inputs, outputs, and acceptance are mandatory.
4. Reviewer approval is required to move to `done`.

## Status Model

- `proposed`: task captured, not yet planned.
- `planned`: scope approved and ready for execution.
- `in_progress`: actively being worked on.
- `blocked`: cannot proceed due to dependency/risk.
- `in_review`: implementation complete and pending reviewer.
- `done`: accepted by reviewer.
- `rejected`: reviewer rejected; requires rework or closure.

## Standard Task Template

```markdown
### TASK-####
- Title: <short task name>
- Status: proposed | planned | in_progress | blocked | in_review | done | rejected
- Owner Agent: main-agent | planner | architect | coder | debugger | reviewer
- Priority: P0 | P1 | P2 | P3
- Created: YYYY-MM-DD
- Updated: YYYY-MM-DD
- Dependencies: TASK-#### | none

#### Input
- Business Goal:
- Context Files:
- Constraints:
- Assumptions:

#### Output
- Deliverables:
- Changed Files:
- Artifacts:

#### Scope
- In Scope:
  - ...
- Out of Scope:
  - ...

#### Acceptance Criteria
- [ ] Functional criteria 1
- [ ] Functional criteria 2
- [ ] Tests or checks pass
- [ ] Reviewer approves

#### Execution Log
- YYYY-MM-DD: <status update and notes>

#### Review Result
- Reviewer:
- Decision: accept | reject
- Evidence:
- Comments:
```

## Example Tasks

### TASK-0001
- Title: Bootstrap agent-build template repository
- Status: done
- Owner Agent: reviewer
- Priority: P0
- Created: 2026-04-07
- Updated: 2026-04-07
- Dependencies: none

#### Input
- Business Goal: Provide reusable starter template for AI agent projects.
- Context Files: README.md, CLAUDE.md, MEMORY.md, TASKS.md, prompts/, agents/, skills/, docs/, specs/, workflows/.
- Constraints: Task-first model, single main controller, mandatory review gate.
- Assumptions: Initial template does not include runtime application code.

#### Output
- Deliverables: Complete folder structure and initial governance documents.
- Changed Files: All template files.
- Artifacts: None.

#### Scope
- In Scope:
  - Create all required directories and files.
  - Define prompts, roles, workflows, and specs.
- Out of Scope:
  - Deployable runtime service.
  - Environment-specific CI scripts.

#### Acceptance Criteria
- [x] Required directory structure exists.
- [x] Every required file has complete usable content.
- [x] Rules enforce all behavior through `TASKS.md`.
- [x] Reviewer role and acceptance gate are defined.

#### Execution Log
- 2026-04-07: Task planned and executed to create baseline template.
- 2026-04-07: Reviewer validated structure and content completeness.

#### Review Result
- Reviewer: reviewer
- Decision: accept
- Evidence: File inventory and policy checks completed.
- Comments: Baseline template ready for reuse.

### TASK-0002
- Title: Add health-check API spec and acceptance checks
- Status: planned
- Owner Agent: architect
- Priority: P2
- Created: 2026-04-07
- Updated: 2026-04-07
- Dependencies: TASK-0001

#### Input
- Business Goal: Define minimum API contract to verify agent project health.
- Context Files: specs/api.yaml, specs/acceptance.md, docs/architecture.md.
- Constraints: Backward compatible with existing task schema.
- Assumptions: Service implementation will be added in downstream projects.

#### Output
- Deliverables: Extended API specification and acceptance checklist updates.
- Changed Files: specs/api.yaml, specs/acceptance.md.
- Artifacts: API contract diff.

#### Scope
- In Scope:
  - Document `/health` response contract.
  - Specify validation expectations for health endpoint.
- Out of Scope:
  - Implementing runtime endpoint.
  - Infrastructure monitoring setup.

#### Acceptance Criteria
- [ ] `specs/api.yaml` includes explicit `/health` contract.
- [ ] `specs/acceptance.md` includes health endpoint checks.
- [ ] Reviewer confirms consistency with architecture docs.

#### Execution Log
- 2026-04-07: Task created from roadmap backlog.

#### Review Result
- Reviewer: N/A
- Decision: N/A
- Evidence: N/A
- Comments: Awaiting implementation.

