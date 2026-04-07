# Skill: design

## Skill Name

Architecture Design Skill

## When to Use

Use this skill when:

1. A task changes system structure, interfaces, or data model.
2. Multiple implementation options require tradeoff analysis.
3. A rollback plan is required for risk control.

## Input Specification

```yaml
task_id: TASK-####
requirements: [string]
constraints: [string]
current_architecture: [string]
```

## Output Specification

```yaml
design_goal: string
proposed_components: [string]
interface_changes: [string]
data_model_changes: [string]
tradeoffs:
  - option: string
    pros: [string]
    cons: [string]
decision: string
validation_plan: [string]
rollback_plan: [string]
```

## Execution Steps

1. Review current architecture and identify impacted boundaries.
2. Draft at least two design options with tradeoffs.
3. Select one option based on constraints and acceptance criteria.
4. Define interface and data impacts explicitly.
5. Specify validation and rollback strategy.
6. Record decision references for memory and docs.

