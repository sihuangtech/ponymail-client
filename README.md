# 🐴 小马邮箱 (PonyMail Client)

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?logo=flutter&logoColor=white)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**小马邮箱 (PonyMail)** 是一款使用 Flutter 构建的跨平台现代邮件客户端，旨在为 macOS、Windows、iOS 和 Android 用户提供如 Spark Mail 般简洁、流畅且高效的邮件处理体验。

---

## ✨ 核心特性

- 🚀 **跨平台支持**：一套代码完美适配桌面端 (macOS/Windows) 与移动端 (iOS/Android)。
- 📥 **多账户管理**：支持集成多个 IMAP/SMTP 邮箱账户。
- 📦 **统一收件箱**：在一个视图中聚合处理所有关联账户的邮件。
- 🔍 **智能本地分类**：基于邮件头部的本地规则自动分类邮件，保护隐私。
- 💾 **离线缓存**：使用 Drift (SQLite) 实现邮件离线存储与秒开体验。
- 🔐 **安全存储**：利用 `flutter_secure_storage` 加密保存账户凭据。
- 🎨 **现代 UI 交互**：圆角卡片流式设计，Hero 动画，支持深色/浅色模式平滑切换。
- 🌐 **全方位国际化**：内置中英文及多语言支持。

---

## 🛠 技术栈

| 模块 | 技术选型 |
| --- | --- |
| **基础框架** | [Flutter](https://flutter.dev) & [Dart](https://dart.dev) |
| **状态管理** | [Riverpod](https://riverpod.dev) |
| **导航路由** | [GoRouter](https://pub.dev/packages/go_router) |
| **持久化层** | [Drift](https://drift.simonbinder.eu/) (SQLite) |
| **邮件协议** | [enough_mail](https://pub.dev/packages/enough_mail) |
| **数据模型** | [Freezed](https://pub.dev/packages/freezed) & [JSON Serializable](https://pub.dev/packages/json_serializable) |
| **本地存储** | [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) |
| **富文本渲染** | [flutter_widget_from_html](https://pub.dev/packages/flutter_widget_from_html) |

---

## 📐 项目目录

```text
lib/
├── core/            # 核心常量、主题与工具类
├── data/            # 数据层：包含数据库、模型 (Freezed) 及仓库实现
│   ├── database/    # Drift 数据库定义
│   ├── datasources/ # IMAP 与本地数据源
│   └── models/      # 实体模型
├── domain/          # 领域层：业务逻辑与 Usecases
├── presentation/    # UI 展现层：界面与 Riverpod Providers
│   ├── screens/     # 各功能模块页面
│   └── widgets/     # 通用 UI 组件
└── l10n/            # 国际化配置 (ARB 文件)
```

---

## 🚀 快速开始

### 1. 克隆项目

```bash
git clone https://github.com/sihuangtech/ponymail-client.git
cd ponymail-client
```

### 2. 环境初始化

确保你已经安装了 Flutter 环境。

```bash
flutter pub get
```

### 3. 生成代码

项目使用了 `drift` 和 `freezed` 等生成工具。

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. 运行应用

```bash
flutter run
```

---

## 📅 开发计划 (Roadmap)

- [x] 多平台基础框架搭建
- [x] 基于 Drift 的数据库架构实现
- [x] 多账户 IMAP/SMTP 基础连接逻辑
- [x] 自定义多语言 (i18n) 方案
- [x] 邮件列表与详情基础 UI
- [ ] IMAP IDLE 后台实时通知支持
- [ ] 富文本编辑器增强 (富文本回复/撰写)
- [ ] 邮件全文搜索优化

---

## 📄 开源协议

本项目采用 **MIT License**。详情请参阅 [LICENSE](LICENSE) 文件。

---

> 🐴 **PonyMail** - 驿路奔跑，灵动收发。
