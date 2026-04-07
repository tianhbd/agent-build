# Product Definition (v0.11)

## 产品定位

`agent-build` 是一个面向 **n8n 外层编排 + 节点复合 agent 内层自治** 的工程模板。

## 目标用户

1. 需要构建多阶段 AI 工作流的工程团队。
2. 需要在 n8n 上编排主流程、在节点内做复杂决策的团队。
3. 需要可审计任务治理与 memory 分层的项目维护者。

## 核心价值

1. 让外层编排和内层智能解耦。
2. 让复合节点可标准化实现与验收。
3. 让 subagent 和 memory 行为可治理、可审计。

## 重点支持场景

- 基于 n8n 的文生视频项目：研究报告 -> 可发布视频。

参考阶段：

1. script-agent
2. tts-agent
3. storyboard-agent
4. asset-agent
5. editor-agent
6. review-agent

## 非目标

1. 强制绑定某一种运行时或语言。
2. 强制绑定 HTTP 服务协议。
3. 提供具体业务模型权重或供应商实现。

## 成功标准

1. 节点分型明确率 100%。
2. composite 节点阶段协议覆盖率 100%。
3. 任务闭环中 reviewer 验收覆盖率 100%。
4. 长期 memory 写回合规率 100%。
