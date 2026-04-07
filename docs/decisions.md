# decisions.md (v0.12)

## DEC-120
- Date: 2026-04-07
- Category: architecture
- Decision: 采用三层架构（n8n 编排层 / 节点复合 agent 层 / subagent 执行层）。
- Status: active

## DEC-121
- Date: 2026-04-07
- Category: governance
- Decision: 固化 subagent 内聚规则，禁止上浮到 n8n 流程层。
- Status: active

## DEC-122
- Date: 2026-04-07
- Category: quality
- Decision: 引入双层质量控制（n8n 流程级 + 节点内容级）。
- Status: active

## DEC-123
- Date: 2026-04-07
- Category: memory
- Decision: 长期 memory 写回必须满足多次验证 + 质量提升 + reviewer 间接确认。
- Status: active
