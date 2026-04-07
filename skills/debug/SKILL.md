# Skill: debug

## Skill Name

Root-Cause Debugging Skill

## When to Use

Use this skill when:

1. Behavior differs from expected requirements.
2. Test failures or runtime errors need systematic diagnosis.
3. A bugfix needs reproducible evidence and regression checks.

## Input Specification

```yaml
task_id: TASK-####
symptom: string
expected_behavior: string
actual_behavior: string
error_logs: [string]
scope_files: [string]
```

## Output Specification

```yaml
task_id: TASK-####
reproduction_steps: [string]
hypotheses: [string]
root_cause: string
fix_plan: [string]
verification_checks:
  - check: string
    result: pass|fail
regression_checks: [string]
```

## Execution Steps

1. Reproduce issue with deterministic steps.
2. Collect and correlate logs, traces, and failing cases.
3. Narrow down cause using hypothesis elimination.
4. Confirm root cause with targeted experiment.
5. Implement minimal-scope fix.
6. Run verification and regression checks, then summarize evidence.

