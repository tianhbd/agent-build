# bugfix-flow.md (v0.12)

## 流程

1. 记录故障任务。
2. 判定故障层：n8n 流程级 / 节点内容级。
3. 定位失败 stage 与 retry/fallback 状态。
4. 实施最小修复。
5. 回归验证。
6. reviewer 验收。

## 规则

1. 未复现不修复。
2. 未校验不放行。
3. 违规 memory 写入先阻断再修复。
