# task-lifecycle.md (v0.12)

## 生命周期

`proposed -> planned -> in_progress -> in_review -> done`

异常：

- `in_progress -> blocked`
- `in_review -> rejected -> in_progress`

## 关键门禁

1. task-first：无任务不执行。
2. composite 任务必须包含阶段协议。
3. 双层质量控制证据齐全才能进入 in_review。
4. reviewer accept 才能 done。
