# data-model.md (v0.12)

## Task Model

| 字段 | 类型 | 说明 |
|---|---|---|
| task_id | string | TASK-#### |
| node_id | string | 节点标识 |
| node_type | enum | simple/composite |
| status | enum | 任务状态 |
| internal_stage_plan | array | 复合节点阶段定义 |
| dual_quality_gates | object | flow/content gate 结果 |

## Stage Model

| 字段 | 类型 | 说明 |
|---|---|---|
| stage_id | string | 阶段 ID |
| stage_goal | string | 阶段目标 |
| stage_input | object | 阶段输入 |
| stage_output | object | 阶段输出 |
| validation_rules | array | 校验规则 |
| retry_policy | object | 重试策略 |
| fallback_action | string | 回退策略 |
| next_stage_condition | string | 进入下一阶段条件 |

## Memory Model

| 字段 | 类型 | 说明 |
|---|---|---|
| layer_name | enum | global/node/task_context/ephemeral |
| readers | array | 可读角色 |
| writers | array | 可写角色 |
| lifecycle | enum | long_term/task_term/short_term |
| promotion_rules | object | 升格约束 |
