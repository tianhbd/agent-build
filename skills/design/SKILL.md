# Skill: design (v0.12)

## 输入

```yaml
task_id: TASK-####
node_id: string
node_goal: string
constraints: [string]
```

## 输出

```yaml
design_pack:
  node_type: simple|composite
  stage_protocol: [object]
  memory_policy: [object]
  subagent_policy: [object]
```

## 步骤

1. 判定节点类型。
2. 设计阶段协议（8字段）。
3. 设计 subagent 生命周期。
4. 设计 memory 分层读写。

## Failure Case

1. 协议字段缺失。
2. subagent 边界冲突。
3. memory 权限冲突。

## Escalation

1. 协议冲突 -> architect + reviewer。
2. 权限冲突 -> main-agent 决策。
