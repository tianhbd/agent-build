# Skill: review (v0.12)

## 输入

```yaml
task_id: TASK-####
node_type: simple|composite
acceptance_criteria: [string]
evidence: [object]
```

## 输出

```yaml
review_result:
  decision: accept|reject
  flow_gate: pass|fail
  content_gate: pass|fail
  required_rework: [string]
```

## 步骤

1. 对照验收标准核验。
2. 检查双层质量控制证据。
3. 检查 subagent 与 memory 边界。
4. 输出 accept/reject。

## Failure Case

1. 证据缺失。
2. 阶段协议不完整。
3. memory 写回违规。

## Escalation

1. 重大违规 -> main-agent + architect。
2. 连续 reject -> 建立专项整改任务。
