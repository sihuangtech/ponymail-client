part of '../database.dart';

class Emails extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountId => integer().named('account_id')();
  IntColumn get remoteUid => integer().named('remote_uid').nullable()();
  TextColumn get messageId => text().named('message_id')();
  TextColumn get mailbox => text()();
  TextColumn get subject => text()();
  TextColumn get fromName => text().named('from_name')();
  TextColumn get fromEmail => text().named('from_email')();
  TextColumn get toList => text().named('to_list')();
  TextColumn get ccList =>
      text().named('cc_list').withDefault(const Constant('[]'))();
  TextColumn get bccList =>
      text().named('bcc_list').withDefault(const Constant('[]'))();
  DateTimeColumn get date => dateTime()();
  TextColumn get preview => text().withDefault(const Constant(''))();
  TextColumn get bodyPlain =>
      text().named('body_plain').withDefault(const Constant(''))();
  TextColumn get bodyHtml =>
      text().named('body_html').withDefault(const Constant(''))();
  BoolColumn get isRead =>
      boolean().named('is_read').withDefault(const Constant(false))();
  BoolColumn get isStarred =>
      boolean().named('is_starred').withDefault(const Constant(false))();
  BoolColumn get isDeleted =>
      boolean().named('is_deleted').withDefault(const Constant(false))();
  BoolColumn get isDraft =>
      boolean().named('is_draft').withDefault(const Constant(false))();
  TextColumn get labels => text().withDefault(const Constant('[]'))();
  TextColumn get threadId =>
      text().named('thread_id').withDefault(const Constant(''))();
  BoolColumn get hasAttachments =>
      boolean().named('has_attachments').withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
