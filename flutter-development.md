# PonyMail Flutter 开发文档

本文档只作为 Flutter 开发文档入口，各平台说明已经拆分为独立文件。

## 通用开发命令

拉取依赖：

```bash
flutter pub get
```

生成代码：

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

监听生成：

```bash
dart run build_runner watch --delete-conflicting-outputs
```

查看设备：

```bash
flutter devices
flutter emulators
```

运行、检查与清理：

```bash
flutter run -d <device_id>
flutter analyze
flutter test
flutter clean
flutter pub get
```

## 平台文档

- [Flutter Android 开发文档](flutter-development-android.md)
- [Flutter iOS 开发文档](flutter-development-ios.md)
- [Flutter macOS 开发文档](flutter-development-macos.md)
- [Flutter Windows 开发文档](flutter-development-windows.md)

## 平台支持说明

- 当前仓库已接入平台：`android`、`ios`、`macos`、`windows`
- 当前仓库未包含：`web`、`linux`
