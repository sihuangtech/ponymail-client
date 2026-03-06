# PonyMail 开发提示词 — 小马邮箱 (Codex)

> 🐴 PonyMail - A beautiful cross-platform email client built with Flutter

---

## 提示词正文

你是一位资深 Flutter 工程师。请帮我从零开始构建一个跨平台邮件客户端 App，支持 macOS、Windows、iOS 和 Android 四个平台，风格类似 Spark Mail（现代、简洁、流畅）。

## 初始化步骤（请最先执行）

在当前目录执行以下命令初始化项目：

```bash
flutter create . --project-name ponymail --org cn.skstudio --platforms ios,android,macos,windows
```

初始化完成后，手动修改各平台的包名/Bundle ID：

| 平台 | 包名 | 修改文件 |
| ------ | ------ | --------- |
| iOS | `cn.skstudio.ponymail.ios` | `ios/Runner.xcodeproj/project.pbxproj` 中的 `PRODUCT_BUNDLE_IDENTIFIER` |
| Android | `cn.skstudio.ponymail.android` | `android/app/build.gradle` 中的 `applicationId` |
| macOS | `cn.skstudio.ponymail.mac` | `macos/Runner.xcodeproj/project.pbxproj` 中的 `PRODUCT_BUNDLE_IDENTIFIER` |
| Windows | `cn.skstudio.ponymail.win` | `windows/runner/Runner.rc` 中的 `CompanyName` 和 `ProductName` |

创建完 `pubspec.yaml` 后，执行以下命令安装最新版本依赖：

```bash
flutter pub upgrade --major-versions
```

添加和卸载依赖包统一使用命令，不要手动编辑 `pubspec.yaml`：

```bash
# 添加依赖
flutter pub add 包名

# 添加开发依赖
flutter pub add --dev 包名

# 卸载依赖
flutter pub remove 包名

# 更新所有依赖到最新版本
flutter pub upgrade --major-versions
```

---

## 项目名称

### PonyMail（小马邮箱）

- GitHub：`https://github.com/sihuangtech/ponymail-client`
- 描述：🐴 PonyMail - A beautiful cross-platform email client for macOS, Windows, iOS & Android. Built with Flutter.

---

## 技术栈要求

### 框架

- Flutter（最新稳定版）
- Dart

### 核心依赖包（pubspec.yaml）

| 包名 | 用途 |
| ------ | ------ |
| `enough_mail` | IMAP/POP3/SMTP 收发邮件 |
| `flutter_riverpod` | 状态管理 |
| `go_router` | 路由导航 |
| `drift` + `sqlite3_flutter_libs` | 本地数据库，缓存邮件 |
| `flutter_secure_storage` | 安全存储账户密码 |
| `flutter_widget_from_html` | 渲染 HTML 邮件正文 |
| `flutter_local_notifications` | 本地推送通知 |
| `cached_network_image` | 头像缓存 |
| `intl` | 日期时间国际化 |
| `freezed` + `json_serializable` | 数据模型 |
| `file_picker` | 选择附件 |
| `open_filex` | 打开附件 |
| `share_plus` | 分享邮件 |

---

## 项目目录结构

```text
lib/
├── main.dart
├── app.dart
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   └── extensions/
├── data/
│   ├── models/          # 数据模型（Account, Email, Mailbox, Attachment）
│   ├── repositories/    # 数据仓库接口 + 实现
│   ├── datasources/
│   │   ├── local/       # Drift 数据库
│   │   └── remote/      # enough_mail IMAP/SMTP
│   └── database/        # Drift 数据库定义
├── domain/
│   ├── entities/
│   └── usecases/
├── presentation/
│   ├── screens/
│   │   ├── splash/
│   │   ├── onboarding/  # 添加账户引导页
│   │   ├── home/        # 主界面（收件箱列表）
│   │   ├── email_detail/ # 邮件详情
│   │   ├── compose/     # 写邮件
│   │   ├── search/      # 搜索
│   │   └── settings/    # 设置
│   ├── widgets/         # 通用组件
│   └── providers/       # Riverpod providers
└── l10n/                # 多语言（中文/英文）
```

---

## 核心功能需求

### 1. 账户管理

- 支持同时添加多个邮箱账户（IMAP/SMTP 协议）
- 支持自动发现邮件服务器配置（enough_mail Discover API）
- 支持手动填写 IMAP/SMTP 服务器、端口、SSL/TLS
- 账户信息用 `flutter_secure_storage` 安全存储
- 支持账户颜色标记，区分不同账户
- 侧边栏/底部栏快速切换账户
- 支持统一收件箱（All Inboxes）视图

### 2. 收件箱

- 按时间倒序列表展示邮件
- 每封邮件显示：发件人头像（首字母 + 颜色）、发件人名称、主题、摘要、时间、已读/未读状态、星标
- 支持下拉刷新
- 支持无限滚动加载更多（IMAP 分页）
- 未读邮件数角标
- 侧滑操作（归档、删除、标记已读）
- 支持多选批量操作

### 3. 智能分类（本地规则）

- 自动将邮件分类为：主要、通知、订阅、社交
- 规则基于发件人域名和邮件头部字段（`List-Unsubscribe` 等）在本地实现，不依赖任何云服务

### 4. 邮件详情页

- 完整渲染 HTML 邮件（使用 `flutter_widget_from_html`）
- 纯文本回退
- 显示收件人、抄送、密送
- 附件列表，支持下载和预览
- 快速回复按钮
- 标记星标、标记已读/未读
- 移动到文件夹
- 删除/归档

### 5. 写邮件（Compose）

- 收件人、抄送、密送输入（支持联系人自动补全）
- 富文本编辑器（加粗、斜体、列表、链接）
- 添加附件（file_picker）
- 草稿自动保存
- 定时发送
- 发送前确认

### 6. 搜索

- 本地全文搜索（搜索已缓存邮件的主题和发件人）
- 服务端 IMAP 搜索（未缓存邮件）

### 7. 文件夹/邮箱管理

- 展示所有 IMAP 文件夹（收件箱、已发送、草稿、垃圾桶、已归档等）
- 支持移动邮件到文件夹

### 8. 通知

- 新邮件本地推送通知（`flutter_local_notifications`）
- 后台定期轮询（IMAP IDLE 优先，不支持则 15 分钟轮询）

### 9. 设置页面

- 账户列表管理（添加、删除、编辑）
- 通知设置
- 主题切换（深色/浅色/跟随系统）
- 签名设置（每个账户独立）
- 缓存清理

---

## UI 设计规范

### 设计风格

- 参考 Spark Mail：现代、极简、圆角卡片风格
- 主色调：可配置（默认蓝色 `#007AFF`）
- 支持深色模式和浅色模式

### 布局

| 平台 | 布局 |
| ------ | ------ |
| macOS / Windows（宽屏） | 三栏布局（账户列表 \| 邮件列表 \| 邮件详情） |
| iPad | 两栏布局 |
| iPhone / Android | 单栏，底部 TabBar 导航 |

### 动画

- 邮件列表侧滑动画流畅
- 页面切换使用 Hero 动画
- 加载状态使用骨架屏（Shimmer 效果）

### 颜色规范

- 未读邮件：加粗字体 + 蓝色圆点
- 已读邮件：普通字体
- 星标邮件：黄色星形图标
- 不同账户：各自颜色标记

---

## 数据库设计（Drift）

### accounts 表

| 字段 | 类型 | 说明 |
| ------ | ------ | ------ |
| id | INTEGER | 主键 |
| email | TEXT | 邮箱地址 |
| display_name | TEXT | 显示名称 |
| imap_host | TEXT | IMAP 服务器 |
| imap_port | INTEGER | IMAP 端口 |
| imap_ssl | BOOLEAN | 是否启用 SSL |
| smtp_host | TEXT | SMTP 服务器 |
| smtp_port | INTEGER | SMTP 端口 |
| smtp_ssl | BOOLEAN | 是否启用 SSL |
| password_key | TEXT | secure storage 的 key |
| color | INTEGER | 账户标记颜色 |
| signature | TEXT | 邮件签名 |
| created_at | DATETIME | 创建时间 |

### emails 表

| 字段 | 类型 | 说明 |
| ------ | ------ | ------ |
| id | INTEGER | 主键 |
| account_id | INTEGER | 关联账户 |
| message_id | TEXT | IMAP UID |
| mailbox | TEXT | 所在文件夹 |
| subject | TEXT | 主题 |
| from_name | TEXT | 发件人名称 |
| from_email | TEXT | 发件人邮箱 |
| to_list | TEXT | 收件人列表（JSON） |
| cc_list | TEXT | 抄送列表（JSON） |
| date | DATETIME | 发送时间 |
| body_plain | TEXT | 纯文本正文 |
| body_html | TEXT | HTML 正文 |
| is_read | BOOLEAN | 是否已读 |
| is_starred | BOOLEAN | 是否星标 |
| is_deleted | BOOLEAN | 是否删除 |
| labels | TEXT | 分类标签 |
| thread_id | TEXT | 会话 ID |
| has_attachments | BOOLEAN | 是否有附件 |
| created_at | DATETIME | 缓存时间 |

### attachments 表

| 字段 | 类型 | 说明 |
| ------ | ------ | ------ |
| id | INTEGER | 主键 |
| email_id | INTEGER | 关联邮件 |
| filename | TEXT | 文件名 |
| mime_type | TEXT | MIME 类型 |
| size | INTEGER | 文件大小 |
| local_path | TEXT | 本地缓存路径 |

### mailboxes 表

| 字段 | 类型 | 说明 |
| ------ | ------ | ------ |
| id | INTEGER | 主键 |
| account_id | INTEGER | 关联账户 |
| name | TEXT | 文件夹名称 |
| path | TEXT | IMAP 路径 |
| type | TEXT | inbox/sent/drafts/trash/archive/custom |
| unread_count | INTEGER | 未读数量 |

---

## 代码规范要求

1. 使用 Riverpod 做状态管理，所有异步操作用 `AsyncNotifier`
2. 使用 Freezed 定义不可变数据模型
3. Repository Pattern 隔离数据层和业务层
4. 错误处理：所有网络操作包装在 `try/catch`，错误统一用 `Either<Failure, T>` 返回
5. 所有字符串使用 `intl` 国际化，支持中文和英文
6. 代码注释用中文
7. 每个文件不超过 300 行，超过则拆分
8. 写单元测试覆盖核心业务逻辑（Repository 层和 UseCase 层）

---

## 开发顺序

**请一次性完成所有开发工作，不要中途停下来询问我。** 遇到任何技术问题请自行上网查阅文档或资料解决，自行做出最佳决策，完成后直接告诉我整体完成情况即可。

请按以下顺序完成：

1. 创建完整的 `pubspec.yaml`
2. 创建项目目录结构和所有文件
3. 实现 Drift 数据库定义（`database.dart`）
4. 实现 Account 数据模型（freezed）
5. 实现 `AccountRepository`（添加账户、获取账户列表、删除账户）
6. 实现 IMAP 连接服务（`ImapService`，基于 `enough_mail`）
7. 实现收件箱加载（获取最新 50 封邮件，存入本地数据库）
8. 实现主界面 UI（账户切换 + 邮件列表）
9. 实现邮件详情页
10. 实现写邮件页面
