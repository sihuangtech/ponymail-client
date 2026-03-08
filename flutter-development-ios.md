# Flutter iOS 开发文档

本文聚焦 PonyMail iOS 平台的命令行开发、调试与构建流程。

## 1. 前置准备

仅能在 macOS 上进行 iOS 构建与调试。

确认 Flutter 与 iOS 工具链可用：

```bash
flutter doctor -v
flutter config --enable-ios
flutter devices
```

安装项目依赖：

```bash
flutter pub get
```

首次或依赖变化后建议执行：

```bash
flutter precache --ios
cd ios
pod install
cd ..
```

如果模型、数据库或国际化有变更，先执行：

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

## 2. 运行与调试

在当前默认设备运行：

```bash
flutter run
```

指定设备运行：

```bash
flutter run -d <ios_device_id>
```

不同模式运行：

```bash
flutter run -d <ios_device_id> --debug
flutter run -d <ios_device_id> --profile
flutter run -d <ios_device_id> --release
```

查看日志与附加调试：

```bash
flutter logs
flutter attach
```

## 3. 构建

构建模拟器版本：

```bash
flutter build ios --debug --simulator
```

构建 Release：

```bash
flutter build ios --release
```

构建免签名 Release：

```bash
flutter build ios --release --no-codesign
```

## 4. 说明

- 真实设备调试通常需要正确配置 Apple Team、Bundle Identifier 与签名证书
- Release 构建、归档和分发前，需要先完成签名配置
- 当 iOS 原生依赖有变化时，可重新执行 `cd ios && pod install`
