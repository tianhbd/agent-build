# node-agent-pattern.md (v0.12)

## 1. 节点角色定义

节点 agent 是阶段控制器，不是一次函数调用。

## 2. 节点类型

### simple node

特征：

1. 单次执行可稳定完成。
2. 无复杂中间态。
3. 通常不需要 subagent。

### composite node

判定规则：满足任意两条即 composite。

1. 不是一次能稳定完成。
2. 需要多阶段加工。
3. 存在中间 JSON。
4. 需要自检或 reviewer。
5. 可拆分为子任务。

## 3. composite 内部循环

1. 接收输入。
2. 读取 memory 分层。
3. 执行当前 stage。
4. 必要时创建 subagent。
5. 校验 stage 输出。
6. 失败则按 retry_policy/fallback_action 处理。
7. 判断 next_stage_condition。
8. 汇总输出返回 n8n。

## 4. subagent 规则

1. subagent 不允许串联调用。
2. subagent 结果必须先回节点 agent。
3. 节点 agent 决定下一步。
4. subagent 不可写 Global/Node Memory。

## 5. 节点输出契约

节点输出必须至少包含：

1. node_id
2. task_id
3. stage_reports
4. result_payload
5. flow_gate_payload
6. retry_hint
