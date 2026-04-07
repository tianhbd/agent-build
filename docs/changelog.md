# Changelog

## [0.12.0] - 2026-04-07

### Added

- 三层架构定义（n8n 编排层、节点复合 agent 层、subagent 执行层）。
- 新增 `docs/composite-agent-flow.md`。
- 双层质量控制机制规范。
- 阶段协议新增 `retry_policy` 字段。

### Changed

- 重写 `README.md`，加入三层架构与流程图。
- 更新 `CLAUDE.md`、`MEMORY.md`、`TASKS.md` 以固化新约束。
- 强化 `prompts/` 与 `agents/` 的 subagent/memory/阶段控制边界。
- 升级 `skills/` 全部 SKILL 模板结构。
- 升级 `specs/` 契约文件。
- 增强 `workflows/` 复合节点流。

## [0.11.0] - 2026-04-07

### Added

- 双层架构（外层编排 + 内层节点自治）基础版本。
