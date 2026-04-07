# memory-layering.md (v0.12)

## 1. 四层结构

1. Global Memory（全局规则）
2. Node Memory（节点能力）
3. Task Context（任务上下文）
4. Ephemeral Memory（临时工作）

## 2. 权限与生命周期

| Layer | 读权限 | 写权限 | 生命周期 |
|---|---|---|---|
| Global | 全部 agent | main-agent 提案 + reviewer 间接确认 | 长期 |
| Node | main-agent + node agent | node agent 提案 + reviewer 间接确认 | 长期 |
| Task Context | 任务相关 agent | main-agent + node agent | 任务周期 |
| Ephemeral | node agent + 授权 subagent | node agent | 短期 |

## 3. 升格规则

仅当同时满足：

1. 多次验证。
2. 提升质量。
3. reviewer 间接确认。

才允许写入长期 memory（Global/Node）。

## 4. 禁止项

1. subagent 写入 Global/Node。
2. 未通过校验的中间 JSON 升格。
3. 敏感片段长期持久化。

## 5. 写回流程

1. 节点 agent 提交写回候选。
2. reviewer 基于任务证据评估。
3. main-agent 执行落盘并记录决策。
