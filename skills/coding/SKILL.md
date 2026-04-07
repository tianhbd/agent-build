# Skill: coding

## Skill Name

Scoped Implementation Skill

## When to Use

Use this skill when:

1. A task is in `in_progress` with approved scope and design.
2. Specific files must be modified to satisfy acceptance criteria.
3. Verification evidence is required for reviewer handoff.

## Input Specification

```yaml
task_id: TASK-####
scope_files: [string]
requirements: [string]
acceptance_criteria: [string]
constraints: [string]
```

## Output Specification

```yaml
task_id: TASK-####
change_summary: string
changed_files: [string]
tests_or_checks:
  - name: string
    result: pass|fail
notes:
  risks: [string]
  followups: [string]
```

## Execution Steps

1. Validate task scope and allowed file set.
2. Implement the smallest viable changes to satisfy criteria.
3. Run required tests or checks.
4. Map each acceptance criterion to evidence.
5. Prepare a concise handoff package for reviewer.
6. Update task execution log with factual results.

