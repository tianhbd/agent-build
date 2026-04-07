# Skill: review

## Skill Name

Acceptance Review Skill

## When to Use

Use this skill when:

1. A task reaches `in_review`.
2. Completion must be validated against explicit criteria.
3. A release or merge decision depends on quality evidence.

## Input Specification

```yaml
task_id: TASK-####
acceptance_criteria: [string]
delivery_evidence:
  changed_files: [string]
  test_results: [string]
  checks: [string]
constraints: [string]
```

## Output Specification

```yaml
task_id: TASK-####
decision: accept|reject
criterion_results:
  - criterion: string
    evidence: string
    pass: true|false
violations: [string]
required_rework: [string]
```

## Execution Steps

1. Validate task scope and criteria from `TASKS.md`.
2. Verify evidence for each criterion one by one.
3. Check compliance with `CLAUDE.md` constraints.
4. Confirm no unauthorized file or scope drift occurred.
5. Produce explicit accept/reject decision.
6. If rejected, list mandatory rework items with evidence links.

