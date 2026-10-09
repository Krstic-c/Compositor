# Compositor 汉化分支（zh-hans）

## 架构与文件
- 上游：robbietilton/Compositor（MIT），Swift / SwiftUI + AppKit。本分支只加简体中文，不改功能。
- 汉化相关文件：`Compositor/Localizable.xcstrings`（翻译）、`Compositor/LocalizedText.swift`（`Text(String)`、`.help(String)` 重载与 `tr()`）。
- 用户内容（项目名、图层名）显示必须用 `Text(verbatim:)`，否则恰好与 key 同名时会被翻译。

## 同步上游
```
git fetch upstream && git checkout zh-hans && git merge upstream/main
```
合并后：编译 → 列出新增/过期字符串 → 补译。`main` 只与上游快进，不放汉化改动。

## 构建
`xcodebuild -project Compositor.xcodeproj -scheme Compositor -destination 'platform=macOS' build CODE_SIGNING_ALLOWED=NO`
命令行构建不会回写 `.xcstrings`，新增字符串要在 Xcode 里打开目录补，或从 `.stringsdata` 提取。

## 已知的坑
- 带 `\(…)` 插值的运行时字符串（撤销名称、部分错误提示）不会自动翻译，需在源码处改用 `String(format: tr("…%@"), …)`。
- 目录符号生成已关闭（`STRING_CATALOG_GENERATE_SYMBOLS = NO`）。
- 汉化版关闭了 Sparkle 更新，升级只能手动合并上游后重新编译。

## 待办
- 状态栏提示、撤销/重做名称中的拼接字符串。
- 目前只做了编译验证，界面逐页目视检查未做。
