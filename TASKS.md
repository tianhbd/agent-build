# TASKS.md (v0.12)

所有行为必须先登记任务。`TASKS.md` 是唯一任务账本。

## 1. 状态机

- `proposed`
- `planned`
- `in_progress`
- `blocked`
- `in_review`
- `done`
- `rejected`

## 2. 标准任务模板

```markdown
### TASK-####
- Title:
- Status: proposed | planned | in_progress | blocked | in_review | done | rejected
- Priority: P0 | P1 | P2 | P3
- Owner Agent: main-agent | planner | architect | coder | debugger | reviewer
- Node ID: NODE-<domain>-<name> | N/A
- Node Type: simple | composite | N/A
- Outer Orchestrator: n8n | N/A
- Created: YYYY-MM-DD
- Updated: YYYY-MM-DD
- Dependencies: TASK-#### | none

#### Input
- Business Goal:
- Upstream Data:
- Constraints:

#### Internal Stage Plan (composite required)
- stage_id:
  - stage_goal:
  - stage_input:
  - stage_output:
  - validation_rules:
  - retry_policy:
  - fallback_action:
  - next_stage_condition:

#### Output
- Deliverables:
- Changed Files:
- Artifacts:

#### Dual Quality Gates
- n8n Flow Gate:
  - [ ] JSON structure valid
  - [ ] required fields complete
  - [ ] executable path valid
- Node Content Gate:
  - [ ] logic correctness
  - [ ] structure coherence
  - [ ] rhythm/consistency
  - [ ] stage transition decision valid

#### Acceptance Criteria
- [ ] Task-first流程遵守
- [ ] 节点类型判定可追溯
- [ ] subagent边界未违反
- [ ] memory写回符合分层规则
- [ ] reviewer evidence complete

#### Execution Log
- YYYY-MM-DD:

#### Review Result
- Reviewer:
- Decision: accept | reject
- Evidence:
- Comments:
```

## 3. 示例任务

### TASK-0120
- Title: 升级模板到 v0.12（三层架构 + 双层质量控制）
- Status: done
- Priority: P0
- Owner Agent: reviewer
- Node ID: N/A
- Node Type: N/A
- Outer Orchestrator: n8n
- Created: 2026-04-07
- Updated: 2026-04-07
- Dependencies: none

#### Input
- Business Goal: 将模板固化为 n8n + 复合节点 agent 工程母版。
- Upstream Data: v0.11 仓库基线。
- Constraints: 规则必须文件化，不可隐藏在 prompt。

#### Internal Stage Plan (composite required)
- stage_id: N/A
  - stage_goal: N/A
  - stage_input: N/A
  - stage_output: N/A
  - validation_rules: N/A
  - retry_policy: N/A
  - fallback_action: N/A
  - next_stage_condition: N/A

#### Output
- Deliverables: v0.12 文档、schema、流程、脚本与约束更新。
- Changed Files: root/docs/prompts/agents/skills/specs/workflows/scripts。
- Artifacts: v0.12 baseline.

#### Dual Quality Gates
- n8n Flow Gate:
  - [x] JSON契约与流程校验规范齐全
  - [x] 字段与阶段映射清晰
  - [x] 可执行路径明确
- Node Content Gate:
  - [x] 节点阶段协议完整
  - [x] subagent边界明确
  - [x] memory分层与升格规则完整
  - [x] reviewer门禁完整

#### Acceptance Criteria
- [x] 三层架构落地
- [x] 双层质量控制落地
- [x] 复合节点判定规则落地
- [x] 阶段协议含 retry_policy
- [x] 工程补强文件齐全

#### Execution Log
- 2026-04-07: 完成 v0.12 全量升级。

#### Review Result
- Reviewer: reviewer
- Decision: accept
- Evidence: 全量文件审查通过。
- Comments: 可直接落库。
