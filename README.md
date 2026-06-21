# PonyMail Client

English | [简体中文](README_zh-CN.md)

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?logo=flutter&logoColor=white)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

PonyMail is a cross-platform email client built with Flutter for macOS, Windows, iOS, and Android. It focuses on multi-account email management, a unified inbox, local caching, attachment handling, and efficient bulk actions while delivering a consistent experience across desktop and mobile platforms.

## Features

- Multi-account management with secure credential storage
- IMAP / SMTP account setup with automatic configuration discovery
- Unified inbox and multi-folder browsing
- Local email cache backed by Drift / SQLite
- HTML email rendering
- Attachment download, opening, caching, and cleanup
- Scheduled sending and recovery of scheduled-send queues
- Entry points for real-time sync and notification preferences
- Multi-select email lists with bulk move, delete, read/unread, and star actions
- Desktop keyboard shortcuts
- English and Simplified Chinese localization

## Tech Stack

| Area | Technology |
| --- | --- |
| Framework | [Flutter](https://flutter.dev) / [Dart](https://dart.dev) |
| State management | [Riverpod](https://riverpod.dev) |
| Routing | [GoRouter](https://pub.dev/packages/go_router) |
| Persistence | [Drift](https://drift.simonbinder.eu/) / SQLite |
| Email protocols | [enough_mail](https://pub.dev/packages/enough_mail) |
| Model generation | [Freezed](https://pub.dev/packages/freezed) / [json_serializable](https://pub.dev/packages/json_serializable) |
| Credential storage | [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) |
| HTML rendering | [flutter_widget_from_html](https://pub.dev/packages/flutter_widget_from_html) |
| Local notifications | [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) |

## Project Structure

```text
lib/
├── core/            # Constants, themes, extensions, and shared utilities
├── data/            # Data layer: databases, models, repositories, and services
│   ├── database/    # Drift tables, mappings, and database access
│   ├── datasources/ # Local and remote data sources
│   ├── models/      # Freezed/JSON models
│   ├── repositories/
│   └── services/
├── domain/          # Use cases and domain logic
├── presentation/    # Screens, widgets, and Riverpod providers
└── l10n/            # ARB files and generated localization code
```

## Main Screens

- **Onboarding / Account Setup** — Initializes accounts, discovers server settings, and collects credentials.
- **Home / Inbox** — Provides a unified inbox, account and folder switching, and bulk-action entry points.
- **Email Detail** — Renders HTML message bodies and handles attachment download, opening, and cache hits.
- **Compose** — Supports attachments, HTML content editing, and scheduled sending.
- **Settings** — Centralizes account, notification, background-sync, scheduled-queue, and cache settings.

## Getting Started

### 1. Install dependencies

```bash
git clone https://github.com/sihuangtech/ponymail-client.git
cd ponymail-client
flutter pub get
```

### 2. Generate code

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

### 3. Run the app

```bash
flutter run
```

### 4. Run checks

```bash
flutter analyze
flutter test
```

## Development Documentation

- [Development overview](flutter-development.md)
- [Android development](flutter-development-android.md)
- [iOS development](flutter-development-ios.md)
- [macOS development](flutter-development-macos.md)
- [Windows development](flutter-development-windows.md)

## Development Notes

- This project uses `build_runner` to generate Drift, Freezed, and JSON-related code.
- Localized copy is defined in `lib/l10n/*.arb`; generated code is produced with `flutter gen-l10n`.
- Email protocol functionality is provided by `enough_mail`, while local persistence uses Drift.
- UI and state management are primarily organized under `lib/presentation`; data reads and writes are centralized under `lib/data`.

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=sihuangtech/ponymail-client&type=Date)](https://www.star-history.com/#sihuangtech/ponymail-client&Date)

## License

This project is licensed under the [MIT License](LICENSE).
