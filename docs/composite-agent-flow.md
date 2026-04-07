# composite-agent-flow.md (v0.12)

## 1. 目标

定义节点级复合 agent 的内部微流程标准。

## 2. 标准内部阶段协议

每个 stage 必须包含：

1. stage_id
2. stage_goal
3. stage_input
4. stage_output
5. validation_rules
6. retry_policy
7. fallback_action
8. next_stage_condition

## 3. 内部执行流程

1. 加载 stage_input 与 memory 层。
2. 执行 stage 逻辑。
3. 若需子任务，创建 subagent。
4. 回收 subagent 并汇总结果。
5. 校验 stage_output。
6. 按 retry_policy 决定重试。
7. 失败则执行 fallback_action。
8. 通过后按 next_stage_condition 决定流转。

## 4. subagent 约束

1. 不允许串联调用。
2. 不参与流程调度。
3. 不可写长期 memory。
4. 结果必须返回节点 agent。

## 5. 输出建议结构

```yaml
stage_report:
  stage_id: string
  status: pass|fail
  validation:
    - rule: string
      result: pass|fail
  retry_count: integer
  fallback_used: boolean
  next_stage_allowed: boolean
```
