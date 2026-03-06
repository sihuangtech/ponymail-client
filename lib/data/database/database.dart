import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text()();
  TextColumn get displayName => text().named('display_name')();
  TextColumn get imapHost => text().named('imap_host')();
  IntColumn get imapPort => integer().named('imap_port')();
  BoolColumn get imapSsl => boolean().named('imap_ssl').withDefault(const Constant(true))();
  TextColumn get smtpHost => text().named('smtp_host')();
  IntColumn get smtpPort => integer().named('smtp_port')();
  BoolColumn get smtpSsl => boolean().named('smtp_ssl').withDefault(const Constant(true))();
  TextColumn get passwordKey => text().named('password_key')();
  IntColumn get color => integer()();
  TextColumn get signature => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
}

class Emails extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountId => integer().named('account_id')();
  TextColumn get messageId => text().named('message_id')();
  TextColumn get mailbox => text()();
  TextColumn get subject => text()();
  TextColumn get fromName => text().named('from_name')();
  TextColumn get fromEmail => text().named('from_email')();
  TextColumn get toList => text().named('to_list')();
  TextColumn get ccList => text().named('cc_list').withDefault(const Constant('[]'))();
  DateTimeColumn get date => dateTime()();
  TextColumn get bodyPlain => text().named('body_plain').withDefault(const Constant(''))();
  TextColumn get bodyHtml => text().named('body_html').withDefault(const Constant(''))();
  BoolColumn get isRead => boolean().named('is_read').withDefault(const Constant(false))();
  BoolColumn get isStarred => boolean().named('is_starred').withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().named('is_deleted').withDefault(const Constant(false))();
  TextColumn get labels => text().withDefault(const Constant('[]'))();
  TextColumn get threadId => text().named('thread_id').withDefault(const Constant(''))();
  BoolColumn get hasAttachments => boolean().named('has_attachments').withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
}

class Attachments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get emailId => integer().named('email_id')();
  TextColumn get filename => text()();
  TextColumn get mimeType => text().named('mime_type')();
  IntColumn get size => integer()();
  TextColumn get localPath => text().named('local_path')();
}

class Mailboxes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountId => integer().named('account_id')();
  TextColumn get name => text()();
  TextColumn get path => text()();
  TextColumn get type => text()();
  IntColumn get unreadCount => integer().named('unread_count').withDefault(const Constant(0))();
}

@DriftDatabase(tables: [Accounts, Emails, Attachments, Mailboxes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'ponymail.sqlite'));
    return NativeDatabase(file);
  });
}
