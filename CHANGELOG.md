（此前的历史未记录，当前状态见 CLAUDE.md）

## 2026-10-09 — zh-hans 分支：简体中文汉化
- 分支 `zh-hans` 基于上游 1.4.7（`af30c45`）；`main` 保持与上游一致。
- 新增 `Compositor/Localizable.xcstrings`（约 1080 条，术语对照 Photoshop 中文版）并注册 `zh-Hans`。
- 新增 `Compositor/LocalizedText.swift`：`Text(String)` / `.help(String)` 重载走本地化查找，`tr()` 供 AppKit 使用。
- AppKit 菜单、弹窗、面板标题改用 `tr()`。
- 关闭 Sparkle 更新（不启动 updater、移除“检查更新”菜单、`SUEnableAutomaticChecks=false`），避免被官方英文版覆盖。
- `.gitignore` 增加 `.claude/`、`node_modules/`。
- 关闭 `STRING_CATALOG_GENERATE_SYMBOLS`（否则 `%lld`、`Type` 这类 key 编译报错）。
