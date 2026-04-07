# Skill: composite-agent (v0.12)

## 输入

```yaml
node_id: string
stage_plan: [object]
input_payload: object
memory_refs: object
```

## 输出

```yaml
composite_result:
  status: success|failed|partial
  stage_reports: [object]
  retry_summary: object
  fallback_summary: object
```

## 步骤

1. 读取阶段协议。
2. 按 stage 顺序执行。
3. 管理 subagent 创建/回收。
4. 执行校验、重试、回退。
5. 汇总输出并回传。

## Failure Case

1. stage_input 不完整。
2. stage_output 校验失败。
3. retry 用尽仍失败。
4. subagent 结果冲突。

## Escalation

1. 结构性失败 -> architect。
2. 重复失败 -> debugger。
3. 规则冲突 -> main-agent。
