# Flutter Windows 开发文档

本文聚焦 PonyMail Windows 平台的命令行开发、调试与构建流程。

## 1. 前置准备

仅能在 Windows 上进行 Windows 桌面构建。

确认 Flutter 与 Windows 工具链可用：

```bash
flutter doctor -v
flutter config --enable-windows-desktop
flutter devices
```

安装项目依赖：

```bash
flutter pub get
```

如果模型、数据库或国际化有变更，先执行：

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

## 2. 运行与调试

运行 Windows 桌面版：

```bash
flutter run -d windows
```

不同模式运行：

```bash
flutter run -d windows --debug
flutter run -d windows --profile
flutter run -d windows --release
```

查看日志与附加调试：

```bash
flutter logs
flutter attach
```

## 3. 构建

构建 Debug：

```bash
flutter build windows --debug
```

构建 Release：

```bash
flutter build windows --release
```

## 4. 构建产物

常见输出目录：

```bash
build/windows/x64/runner/
```
