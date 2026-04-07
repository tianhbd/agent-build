# n8n-integration.md (v0.12)

## 1. 集成目标

外层 n8n 稳定编排，中层节点 agent 自治执行，内层 subagent 内聚。

## 2. n8n 外层职责

1. 顺序执行阶段。
2. 统一 JSON 流转。
3. 条件分支。
4. 重试与中断。
5. 观测日志。
6. 流程级校验（JSON结构、必填字段、基础可执行性）。

## 3. 节点 agent 职责

1. 阶段拆分与推进。
2. subagent 管理。
3. memory 分层读取与写回控制。
4. 中间 JSON 校验。
5. 内容质量判断。

## 4. 流程级输入输出建议

### 输入（n8n -> node）

```json
{
  "task_id": "TASK-0121",
  "node_id": "NODE-video-script-agent",
  "node_type": "composite",
  "payload": {},
  "trace_id": "run-20260407-1001"
}
```

### 输出（node -> n8n）

```json
{
  "task_id": "TASK-0121",
  "node_id": "NODE-video-script-agent",
  "status": "success",
  "flow_gate_payload": {
    "json_schema_valid": true,
    "required_fields_valid": true
  },
  "stage_reports": [],
  "result_payload": {},
  "retry_hint": "none"
}
```

## 5. 文生视频阶段映射

1. script-agent：composite
2. tts-agent：simple（可升级）
3. storyboard-agent：composite
4. asset-agent：composite
5. editor-agent：simple（可升级）
6. review-agent：composite

## 6. 双层质量控制落点

1. n8n：只做流程级质量。
2. 节点 agent：只做内容质量。
3. reviewer：最终门禁。
