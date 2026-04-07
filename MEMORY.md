# MEMORY.md

Persistent project memory for decisions, architecture records, and operational learning.

## Usage Rules

1. Record only durable decisions and non-trivial findings.
2. Every record must reference related task IDs.
3. Update records when decisions are superseded.
4. Do not remove historical records; mark status as superseded.

## Decision Record Template

```markdown
### DEC-###
- Date: YYYY-MM-DD
- Related Task(s): TASK-####
- Topic: <decision topic>
- Context: <what triggered the decision>
- Options Considered:
  - Option A: <summary>
  - Option B: <summary>
- Decision: <chosen option and why>
- Consequences:
  - Positive: <impact>
  - Tradeoff: <cost/risk>
- Status: active | superseded
- Supersedes: DEC-### | N/A
- Superseded By: DEC-### | N/A
```

## Architecture Record Template

```markdown
### ADR-###
- Date: YYYY-MM-DD
- Related Task(s): TASK-####
- Title: <architecture change title>
- Problem: <current architecture limitation>
- Constraints:
  - <constraint 1>
  - <constraint 2>
- Decision: <architecture decision>
- Interfaces Affected:
  - <component or API>
- Data Impact:
  - <schema/model changes>
- Validation Plan:
  - <tests/checks required>
- Rollback Plan:
  - <how to revert safely>
- Status: proposed | accepted | deprecated
```

## Operational Memory Template

```markdown
### MEM-###
- Date: YYYY-MM-DD
- Related Task(s): TASK-####
- Observation: <important behavior observed>
- Evidence: <logs/tests/metrics link>
- Action Taken: <what was changed>
- Follow-up Needed: yes | no
```

## Current Records

### DEC-001
- Date: 2026-04-07
- Related Task(s): TASK-0001
- Topic: Task-first orchestration model
- Context: Need a reusable agent project template with deterministic governance.
- Options Considered:
  - Option A: Agent-first delegation with implicit state.
  - Option B: Task-first flow with explicit task ledger and reviewer gate.
- Decision: Adopt option B to maximize traceability, control, and reproducibility.
- Consequences:
  - Positive: Clear audit trail and reduced hidden behavior.
  - Tradeoff: Additional documentation overhead.
- Status: active
- Supersedes: N/A
- Superseded By: N/A

### ADR-001
- Date: 2026-04-07
- Related Task(s): TASK-0001
- Title: Single main-controller with specialized subagents
- Problem: Uncoordinated multi-agent execution can cause scope drift.
- Constraints:
  - All work must be mediated by `TASKS.md`.
  - Each subagent must keep a single responsibility.
- Decision: Main agent controls planning, assignment, and status; subagents execute scoped tasks only.
- Interfaces Affected:
  - `prompts/main-agent.md`
  - `agents/*.md`
- Data Impact:
  - Task schema requires owner role and acceptance block.
- Validation Plan:
  - Verify every completed task has a reviewer decision.
- Rollback Plan:
  - Revert to previous prompt and workflow files if orchestration is unstable.
- Status: accepted

