# composite-agent-flow.md (v0.12)

## 1. 执行目的

定义复合节点在工作流中的内部执行步骤和门禁。

## 2. 执行步骤

1. main-agent 分配 composite 任务。
2. 节点 agent 读取阶段协议。
3. 执行当前 stage。
4. 必要时创建 subagent。
5. subagent 输出回节点 agent。
6. 节点 agent 校验 JSON 与内容质量。
7. 按 retry_policy/fallback_action 处理失败。
8. 通过 next_stage_condition 决定阶段流转。
9. 汇总输出给 n8n。
10. reviewer 验收后完成任务。

## 3. 双层质量控制对接

1. n8n：流程级校验。
2. 节点 agent：内容级校验。

## 4. 违规即阻断

1. subagent 串联调用。
2. subagent 直接写长期 memory。
3. 阶段协议字段不完整。
