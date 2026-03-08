# Flutter macOS 开发文档

本文聚焦 PonyMail macOS 平台的命令行开发、调试与构建流程。

## 1. 前置准备

仅能在 macOS 上进行 macOS 桌面构建。

确认 Flutter 与 macOS 工具链可用：

```bash
flutter doctor -v
flutter config --enable-macos-desktop
flutter devices
```

安装项目依赖：

```bash
flutter pub get
```

首次或依赖变化后建议执行：

```bash
flutter precache --macos
cd macos
pod install
cd ..
```

如果模型、数据库或国际化有变更，先执行：

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

## 2. 运行与调试

运行 macOS 桌面版：

```bash
flutter run -d macos
```

不同模式运行：

```bash
flutter run -d macos --debug
flutter run -d macos --profile
flutter run -d macos --release
```

查看日志与附加调试：

```bash
flutter logs
flutter attach
```

## 3. 构建

构建 Debug：

```bash
flutter build macos --debug
```

构建 Release：

```bash
flutter build macos --release
```

## 4. 构建产物

常见输出目录：

```bash
build/macos/Build/Products/
```

## 5. 说明

- `macos/Podfile` 当前最低系统版本为 `10.15`
- 如果涉及签名、公证或分发，需要额外配置 Apple Developer 相关参数
