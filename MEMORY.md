# MEMORY.md (v0.12)

本文件定义 memory 分层、读写权限、生命周期与升格规则。

## 1. 四层 memory

| 层级 | 用途 | 可读 | 可写 | 生命周期 |
|---|---|---|---|---|
| Global Memory | 全局规则、跨任务决策 | 全部 agent | main-agent 提案 + reviewer 间接确认后落盘 | 长期 |
| Node Memory | 节点能力、节点策略 | main-agent + 对应节点 agent | 节点 agent 提案 + reviewer 间接确认后落盘 | 长期 |
| Task Context | 当前任务上下文、阶段索引 | 当前任务相关 agent | main-agent + 当前节点 agent | 任务周期 |
| Ephemeral Memory | 临时推理、中间 JSON、草稿 | 当前节点 agent + 授权 subagent | 当前节点 agent | 短期 |

## 2. 升格规则（Ephemeral/Task Context -> Node/Global）

只有同时满足以下条件才可升格：

1. 多次验证：至少在多个任务或多个阶段验证稳定。
2. 提升质量：明确提高输出质量、稳定性或效率。
3. reviewer 间接确认：通过任务验收证据确认可沉淀。

## 3. 禁止升格内容

1. 一次性临时草稿。
2. 未通过校验的中间 JSON。
3. 敏感片段或原始密钥。
4. subagent 未经节点 agent 审核的输出。

## 4. subagent 与 memory 规则

1. subagent 可读取受限的 Ephemeral 子集。
2. subagent 不可写 Global/Node Memory。
3. subagent 输出必须先回节点 agent。
4. 节点 agent 决定是否写入 Task Context。

## 5. 决策模板

```markdown
### DEC-###
- Date:
- Related Task(s):
- Scope: global | node:<id>
- Decision:
- Evidence:
- Quality Impact:
- Reviewer Link:
- Status: active | superseded
```

## 6. 当前基线记忆

### DEC-120
- Date: 2026-04-07
- Related Task(s): TASK-0120
- Scope: global
- Decision: 固化三层架构（n8n 编排层 / 节点复合 agent 层 / subagent 执行层）。
- Evidence: docs/architecture.md v0.12
- Quality Impact: 流程与内容决策解耦，降低耦合风险。
- Reviewer Link: TASK-0120 Review Result
- Status: active

### DEC-121
- Date: 2026-04-07
- Related Task(s): TASK-0120
- Scope: global
- Decision: 固化双层质量控制机制（n8n 流程级 + 节点内容级）。
- Evidence: docs/n8n-integration.md, docs/composite-agent-flow.md
- Quality Impact: 提升执行稳定性与内容一致性。
- Reviewer Link: TASK-0120 Review Result
- Status: active

### DEC-122
- Date: 2026-04-07
- Related Task(s): TASK-0120
- Scope: global
- Decision: 长期 memory 写回必须满足多次验证 + 质量提升 + reviewer 间接确认。
- Evidence: docs/memory-layering.md, specs/memory-layer-schema.yaml
- Quality Impact: 降低错误知识沉淀概率。
- Reviewer Link: TASK-0120 Review Result
- Status: active
