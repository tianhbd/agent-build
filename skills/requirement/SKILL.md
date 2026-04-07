# Skill: requirement

## Skill Name

Requirement Structuring Skill

## When to Use

Use this skill when:

1. A new user request needs precise scope definition.
2. Requirements are ambiguous or mixed with implementation ideas.
3. The team needs clear acceptance criteria before planning.

## Input Specification

```yaml
request_summary: string
business_goal: string
constraints: [string]
stakeholders: [string]
known_risks: [string]
```

## Output Specification

```yaml
problem_statement: string
functional_requirements: [string]
non_functional_requirements: [string]
scope:
  in: [string]
  out: [string]
acceptance_criteria: [string]
assumptions: [string]
open_questions: [string]
```

## Execution Steps

1. Normalize user intent into one problem statement.
2. Separate functional and non-functional requirements.
3. Define in-scope and out-of-scope boundaries.
4. Convert requirements into measurable acceptance criteria.
5. Capture assumptions and unresolved questions.
6. Hand off structured output to planner for task creation.

