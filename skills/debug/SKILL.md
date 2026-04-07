# Skill: debug (v0.12)

## 输入

```yaml
task_id: TASK-####
node_id: string
error_logs: [string]
```

## 输出

```yaml
debug_report:
  root_cause: string
  failed_stage: string|N/A
  fix_plan: [string]
  regression_checks: [string]
```

## 步骤

1. 复现问题。
2. 定位流程级或节点级故障。
3. 对 composite 标明失败 stage。
4. 验证修复与回归。

## Failure Case

1. 无法复现。
2. 根因跨节点。
3. 修复后回归失败。

## Escalation

1. 无法复现 -> main-agent 创建诊断任务。
2. 跨节点故障 -> architect 回查架构。
