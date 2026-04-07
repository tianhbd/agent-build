# Skill: requirement (v0.12)

## 输入

```yaml
project_goal: string
input_artifact: string
output_target: string
constraints: [string]
```

## 输出

```yaml
requirement_pack:
  stages: [string]
  node_types:
    - node_id: string
      node_type: simple|composite
  acceptance_criteria: [string]
```

## 步骤

1. 提炼业务目标。
2. 拆解外层阶段。
3. 按规则判定节点类型。
4. 产出可验证验收标准。

## Failure Case

1. 需求冲突。
2. 节点类型无法判定。
3. 验收标准不可测。

## Escalation

1. 需求冲突 -> 升级 planner + architect。
2. 类型不确定 -> 先按 composite 设计再裁剪。
