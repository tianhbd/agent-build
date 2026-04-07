# CLAUDE.md (v0.12)

本文件是仓库级强约束，所有 agent / subagent 必须遵守。

## 1. 核心思想

1. n8n 管流程。
2. agent 管阶段。
3. subagent 内聚。
4. memory 分层。
5. task-first。
6. review-gated。

## 2. 三层架构边界

### 2.1 n8n 编排层

允许：

1. 阶段顺序执行。
2. 数据流转（统一 JSON）。
3. 条件分支。
4. 重试与中断。
5. 日志与可观测性。
6. 流程级校验（格式/字段）。

禁止：

1. 内容生成与推理。
2. subagent 调度。
3. memory 写入。
4. 内容质量判断。

### 2.2 节点级复合 agent

允许：

1. 内部阶段拆分。
2. subagent 创建与回收。
3. memory 分层读取与写回控制。
4. 中间 JSON 校验。
5. 失败回退与重试。
6. 结果汇总输出。

### 2.3 subagent 执行层

强约束：

1. 短生命周期。
2. 单一任务。
3. 不参与流程调度。
4. 输出必须返回节点 agent。
5. 不可写 Global/Node Memory。

## 3. 复合节点判定规则

任意两条满足即判定为 composite：

1. 不是一次能稳定完成。
2. 需要多阶段加工。
3. 存在中间 JSON。
4. 需要自检或 reviewer。
5. 可拆分为子任务。

## 4. 节点内部阶段协议（强制）

每个 composite 节点每个 stage 必须具备：

1. `stage_id`
2. `stage_goal`
3. `stage_input`
4. `stage_output`
5. `validation_rules`
6. `retry_policy`
7. `fallback_action`
8. `next_stage_condition`

## 5. memory 分层与权限

1. Global Memory：全局规则，长期。
2. Node Memory：节点能力，长期。
3. Task Context：任务上下文，任务周期。
4. Ephemeral Memory：临时推理，短期。

长期写回（Global/Node）规则：

1. 必须多次验证。
2. 必须证明质量提升。
3. 必须经 reviewer 间接确认。

## 6. 禁止行为

1. 无任务直接改动文件。
2. 修改任务授权范围外文件。
3. subagent 串联调用。
4. subagent 直连 n8n 流程。
5. subagent 直接写长期 memory。
6. 跳过阶段校验推进下一阶段。
7. reviewer 未通过即标记 done。
8. 将关键规则仅放在 prompt 而不落文件。

## 7. 质量控制双层机制

1. n8n：流程级质量（JSON、字段、可执行性）。
2. 节点 agent：内容质量（逻辑、结构、节奏、一致性、阶段推进决策）。

## 8. 任务门禁

任何执行前必须满足：

1. `TASKS.md` 已登记任务。
2. 节点类型已判定。
3. composite 节点阶段协议已定义。
4. 验收标准可验证。
5. reviewer 路径已定义。
