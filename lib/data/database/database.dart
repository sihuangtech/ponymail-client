import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/account_model.dart';
import '../models/email_model.dart';
import '../models/mailbox_model.dart';

part 'database.g.dart';

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text()();
  TextColumn get displayName => text().named('display_name')();
  TextColumn get imapHost => text().named('imap_host')();
  IntColumn get imapPort => integer().named('imap_port')();
  BoolColumn get imapSsl =>
      boolean().named('imap_ssl').withDefault(const Constant(true))();
  TextColumn get smtpHost => text().named('smtp_host')();
  IntColumn get smtpPort => integer().named('smtp_port')();
  BoolColumn get smtpSsl =>
      boolean().named('smtp_ssl').withDefault(const Constant(true))();
  TextColumn get passwordKey => text().named('password_key')();
  IntColumn get color => integer()();
  TextColumn get signature => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
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
  TextColumn get labels => text().withDefault(const Constant('[]'))();
  TextColumn get threadId =>
      text().named('thread_id').withDefault(const Constant(''))();
  BoolColumn get hasAttachments =>
      boolean().named('has_attachments').withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
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
  IntColumn get unreadCount =>
      integer().named('unread_count').withDefault(const Constant(0))();
}

@DriftDatabase(tables: [Accounts, Emails, Attachments, Mailboxes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<AccountModel>> getAccountModels() async {
    final rows = await select(accounts).get();
    return rows.map(_mapAccount).toList();
  }

  Future<List<EmailModel>> getInboxEmails({
    int? accountId,
    int limit = 50,
  }) async {
    final query = select(emails)
      ..where((tbl) => tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.date)])
      ..limit(limit);
    if (accountId != null) {
      query.where((tbl) => tbl.accountId.equals(accountId));
    }
    final rows = await query.get();
    return rows.map(_mapEmail).toList();
  }

  Future<EmailModel?> getEmailById(int id) async {
    final row = await (select(emails)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _mapEmail(row);
  }

  Future<List<MailboxModel>> getMailboxModels({int? accountId}) async {
    final query = select(mailboxes);
    if (accountId != null) {
      query.where((tbl) => tbl.accountId.equals(accountId));
    }
    final rows = await query.get();
    return rows.map(_mapMailbox).toList();
  }

  Future<void> replaceAccounts(List<AccountModel> values) async {
    await batch((batch) {
      batch.deleteAll(accounts);
      batch.insertAll(
        accounts,
        values.map(
          (account) => AccountsCompanion.insert(
            id: Value(account.id),
            email: account.email,
            displayName: account.displayName,
            imapHost: account.imapHost,
            imapPort: account.imapPort,
            imapSsl: Value(account.imapSsl),
            smtpHost: account.smtpHost,
            smtpPort: account.smtpPort,
            smtpSsl: Value(account.smtpSsl),
            passwordKey: account.passwordKey,
            color: account.color,
            signature: Value(account.signature),
            createdAt: Value(account.createdAt),
          ),
        ),
      );
    });
  }

  Future<void> replaceEmails(List<EmailModel> values) async {
    await batch((batch) {
      batch.deleteAll(emails);
      batch.insertAll(
        emails,
        values.map(
          (email) => EmailsCompanion.insert(
            id: Value(email.id),
            accountId: email.accountId,
            messageId: email.messageId,
            mailbox: email.mailbox,
            subject: email.subject,
            fromName: email.fromName,
            fromEmail: email.fromEmail,
            toList: jsonEncode(email.to.map((item) => item.toJson()).toList()),
            ccList: Value(
              jsonEncode(email.cc.map((item) => item.toJson()).toList()),
            ),
            date: email.date,
            preview: Value(email.preview),
            bodyPlain: Value(email.bodyPlain),
            bodyHtml: Value(email.bodyHtml),
            isRead: Value(email.isRead),
            isStarred: Value(email.isStarred),
            isDeleted: Value(email.isDeleted),
            labels: Value(jsonEncode(email.labels)),
            threadId: Value(email.threadId),
            hasAttachments: Value(email.hasAttachments),
          ),
        ),
      );
    });
  }

  Future<void> replaceMailboxes(List<MailboxModel> values) async {
    await batch((batch) {
      batch.deleteAll(mailboxes);
      batch.insertAll(
        mailboxes,
        values.map(
          (mailbox) => MailboxesCompanion.insert(
            id: Value(mailbox.id),
            accountId: mailbox.accountId,
            name: mailbox.name,
            path: mailbox.path,
            type: mailbox.type,
            unreadCount: Value(mailbox.unreadCount),
          ),
        ),
      );
    });
  }

  AccountModel _mapAccount(Account row) {
    return AccountModel(
      id: row.id,
      email: row.email,
      displayName: row.displayName,
      imapHost: row.imapHost,
      imapPort: row.imapPort,
      imapSsl: row.imapSsl,
      smtpHost: row.smtpHost,
      smtpPort: row.smtpPort,
      smtpSsl: row.smtpSsl,
      passwordKey: row.passwordKey,
      color: row.color,
      signature: row.signature,
      createdAt: row.createdAt,
    );
  }

  EmailModel _mapEmail(Email row) {
    return EmailModel(
      id: row.id,
      accountId: row.accountId,
      messageId: row.messageId,
      mailbox: row.mailbox,
      subject: row.subject,
      fromName: row.fromName,
      fromEmail: row.fromEmail,
      to: _decodeAddresses(row.toList),
      cc: _decodeAddresses(row.ccList),
      date: row.date,
      preview: row.preview,
      bodyPlain: row.bodyPlain,
      bodyHtml: row.bodyHtml,
      isRead: row.isRead,
      isStarred: row.isStarred,
      isDeleted: row.isDeleted,
      labels: _decodeStringList(row.labels),
      threadId: row.threadId,
      hasAttachments: row.hasAttachments,
    );
  }

  MailboxModel _mapMailbox(Mailboxe row) {
    return MailboxModel(
      id: row.id,
      accountId: row.accountId,
      name: row.name,
      path: row.path,
      type: row.type,
      unreadCount: row.unreadCount,
    );
  }

  List<EmailAddressModel> _decodeAddresses(String raw) {
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((item) => Map<String, dynamic>.from(item as Map))
        .toList();
    return list.map(EmailAddressModel.fromJson).toList();
  }

  List<String> _decodeStringList(String raw) {
    return (jsonDecode(raw) as List<dynamic>).cast<String>();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'ponymail.sqlite'));
    return NativeDatabase(file);
  });
}
