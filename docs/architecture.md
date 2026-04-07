# architecture.md (v0.12)

## 1. 架构总览

`agent-build v0.12` 采用三层架构：

1. 外层：n8n 编排层。
2. 中层：节点级复合 agent 控制层。
3. 内层：subagent 执行层。

## 2. 外层 n8n 编排层

职责：

1. 阶段顺序执行。
2. 数据流转（统一 JSON）。
3. 条件分支。
4. 重试与中断。
5. 日志与可观测性。
6. 流程级校验（格式/字段）。

非职责：

1. 内容生成与推理。
2. subagent 调度。
3. memory 写入。
4. 内容质量判断。

## 3. 中层节点级复合 agent

职责：

1. 内部阶段拆分。
2. subagent 创建与回收。
3. 分层 memory 读取与写回控制。
4. 中间 JSON 校验。
5. 失败回退与重试。
6. 结果汇总输出。

## 4. 内层 subagent 执行层

约束：

1. 短生命周期。
2. 单一任务。
3. 不参与流程调度。
4. 不可直接写长期 memory。
5. 输出必须回节点 agent。

## 5. 复合节点判定规则

任意两条满足即 composite：

1. 不是一次能稳定完成。
2. 需要多阶段加工。
3. 存在中间 JSON。
4. 需要自检或 reviewer。
5. 可拆分为子任务。

## 6. 节点内部阶段协议

每阶段必须定义：

1. `stage_id`
2. `stage_goal`
3. `stage_input`
4. `stage_output`
5. `validation_rules`
6. `retry_policy`
7. `fallback_action`
8. `next_stage_condition`

## 7. 双层质量控制

### n8n 流程级

1. JSON 结构校验。
2. 必填字段校验。
3. 基础可执行性校验。

### 节点内容级

1. 逻辑正确性。
2. 结构合理性。
3. 节奏一致性。
4. 阶段流转判断。

## 8. 文生视频阶段参考

1. script-agent（composite）
2. tts-agent（simple，可升级）
3. storyboard-agent（composite）
4. asset-agent（composite）
5. editor-agent（simple，可升级）
6. review-agent（composite）
