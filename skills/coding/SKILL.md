# Skill: coding (v0.12)

## 输入

```yaml
task_id: TASK-####
node_type: simple|composite
stage_protocol: [object]
scope_files: [string]
```

## 输出

```yaml
implementation_result:
  changed_files: [string]
  stage_reports: [object]
  flow_gate_payload: object
  content_gate_payload: object
```

## 步骤

1. 校验任务范围。
2. 实现节点逻辑。
3. composite 节点实现 stage/retry/fallback。
4. 汇总并输出结构化证据。

## Failure Case

1. stage 输出校验失败。
2. fallback 后仍失败。
3. subagent 输出不一致。

## Escalation

1. 连续失败 -> debugger。
2. 协议无法满足 -> architect。
