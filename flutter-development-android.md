# Flutter Android 开发文档

本文聚焦 PonyMail Android 平台的命令行开发、调试与构建流程。

## 1. 前置准备

确认 Flutter 与 Android 工具链可用：

```bash
flutter doctor -v
flutter config --enable-android
flutter devices
adb devices
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

在当前默认设备运行：

```bash
flutter run
```

指定设备运行：

```bash
flutter run -d <android_device_id>
```

不同模式运行：

```bash
flutter run -d <android_device_id> --debug
flutter run -d <android_device_id> --profile
flutter run -d <android_device_id> --release
```

查看日志与附加调试：

```bash
flutter logs
flutter attach
adb logcat
```

## 3. 构建

构建 Debug APK：

```bash
flutter build apk --debug
```

构建 Release APK：

```bash
flutter build apk --release
```

构建 Release App Bundle：

```bash
flutter build appbundle --release
```

如果需要直接走 Gradle：

```bash
cd android
./gradlew assembleDebug
./gradlew assembleRelease
./gradlew bundleRelease
cd ..
```

## 4. 构建产物

常见输出目录：

```bash
build/app/outputs/flutter-apk/
build/app/outputs/bundle/release/
```

## 5. 说明

- Android 包名当前为 `cn.skstudio.ponymail.android`
- 当前 `release` 构建配置仍使用 debug signing，仅适合本地验证
- 正式发版前需要补充 keystore、签名配置和版本管理流程
