# PonyMail Client

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?logo=flutter&logoColor=white)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

PonyMail 是一个使用 Flutter 构建的跨平台邮件客户端，面向 macOS、Windows、iOS 和 Android。项目聚焦于多账户邮件收发、统一收件箱、本地缓存、附件管理和高效率批量处理体验，在统一代码栈下提供桌面端与移动端一致的使用方式。

## 特性

- 多账户管理与安全凭据存储
- IMAP / SMTP 账户接入与自动发现配置
- 统一收件箱与多文件夹浏览
- 基于 Drift / SQLite 的本地邮件缓存
- HTML 邮件正文渲染
- 附件下载、打开、缓存与清理
- 定时发送与计划队列恢复
- 实时同步入口与通知偏好配置
- 邮件列表多选、批量移动、批量删除、批量已读/未读、批量星标
- 桌面端快捷键支持
- 中英文国际化

## 技术栈

| 模块 | 技术选型 |
| --- | --- |
| 基础框架 | [Flutter](https://flutter.dev) / [Dart](https://dart.dev) |
| 状态管理 | [Riverpod](https://riverpod.dev) |
| 路由 | [GoRouter](https://pub.dev/packages/go_router) |
| 持久化 | [Drift](https://drift.simonbinder.eu/) / SQLite |
| 邮件协议 | [enough_mail](https://pub.dev/packages/enough_mail) |
| 模型生成 | [Freezed](https://pub.dev/packages/freezed) / [json_serializable](https://pub.dev/packages/json_serializable) |
| 凭据存储 | [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) |
| HTML 渲染 | [flutter_widget_from_html](https://pub.dev/packages/flutter_widget_from_html) |
| 本地通知 | [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) |

## 项目结构

```text
lib/
├── core/            # 常量、主题、扩展、基础工具
├── data/            # 数据层：数据库、模型、仓库、服务
│   ├── database/    # Drift 表、映射与数据库读写
│   ├── datasources/ # 本地与远程数据源
│   ├── models/      # Freezed/JSON 模型
│   ├── repositories/
│   └── services/
├── domain/          # 用例与领域逻辑
├── presentation/    # 页面、组件、Riverpod providers
└── l10n/            # ARB 与生成后的国际化代码
```

## 主要页面

- Onboarding / Account Setup
  用于初始化账户、自动发现服务器配置和凭据录入。
- Home / Inbox
  提供统一收件箱、账户切换、文件夹切换和批量操作入口。
- Email Detail
  渲染 HTML 正文并处理附件下载、打开与缓存命中。
- Compose
  支持附件、HTML 内容输入和计划发送。
- Settings
  集中管理账户、通知偏好、后台同步偏好、计划队列和缓存。

## 快速开始

### 1. 获取依赖

```bash
git clone https://github.com/sihuangtech/ponymail-client.git
cd ponymail-client
flutter pub get
```

### 2. 生成代码

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

### 3. 运行

```bash
flutter run
```

### 4. 常用校验

```bash
flutter analyze
flutter test
```

## 开发文档

- 开发文档入口见 [flutter-development.md](flutter-development.md)
- Android 平台见 [flutter-development-android.md](flutter-development-android.md)
- iOS 平台见 [flutter-development-ios.md](flutter-development-ios.md)
- macOS 平台见 [flutter-development-macos.md](flutter-development-macos.md)
- Windows 平台见 [flutter-development-windows.md](flutter-development-windows.md)

## 开发说明

- 本项目使用 `build_runner` 生成 Drift、Freezed 和 JSON 相关代码。
- 国际化文案定义在 `lib/l10n/*.arb`，生成代码由 `flutter gen-l10n` 输出。
- 邮件协议能力基于 `enough_mail`，本地数据持久化使用 Drift。
- UI 与状态管理主要组织在 `lib/presentation` 下，业务读写集中在 `lib/data`。

## 开源协议

本项目采用 **MIT License**。详见 [LICENSE](LICENSE)。
