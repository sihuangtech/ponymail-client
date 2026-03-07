import 'dart:io';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/account_model.dart';
import '../models/attachment_model.dart';
import '../models/email_model.dart';
import '../models/mailbox_model.dart';

part 'database.g.dart';
part 'mappers/database_decoders.dart';
part 'mappers/database_mappers.dart';
part 'tables/account_tables.dart';
part 'tables/attachment_tables.dart';
part 'tables/email_tables.dart';
part 'tables/mailbox_tables.dart';

@DriftDatabase(tables: [Accounts, Emails, Attachments, Mailboxes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  Future<List<AccountModel>> getAccountModels() async {
    final rows = await select(accounts).get();
    return rows.map(_mapAccount).toList();
  }

  Future<List<EmailModel>> getInboxEmails({
    int? accountId,
    int limit = 50,
    String? mailboxPath,
  }) async {
    final query = select(emails)
      ..where((tbl) => tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.date)])
      ..limit(limit);
    if (accountId != null) {
      query.where((tbl) => tbl.accountId.equals(accountId));
    }
    if (mailboxPath != null && mailboxPath.isNotEmpty) {
      query.where((tbl) => tbl.mailbox.equals(mailboxPath));
    }
    final rows = await query.get();
    return rows.map(_mapEmail).toList();
  }

  Future<List<EmailModel>> searchCachedEmails(
    String queryText, {
    int? accountId,
  }) async {
    final normalized = '%${queryText.toLowerCase()}%';
    final query = select(emails)
      ..where(
        (tbl) =>
            tbl.subject.lower().like(normalized) |
            tbl.fromName.lower().like(normalized) |
            tbl.fromEmail.lower().like(normalized),
      )
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.date)])
      ..limit(50);
    if (accountId != null) {
      query.where((tbl) => tbl.accountId.equals(accountId));
    }
    final rows = await query.get();
    return rows.map(_mapEmail).toList();
  }

  Future<EmailModel?> getEmailById(int id) async {
    final row = await (select(
      emails,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
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

  Future<List<AttachmentModel>> getAttachmentsForEmail(int emailId) async {
    final rows =
        await (select(attachments)
              ..where((tbl) => tbl.emailId.equals(emailId))
              ..orderBy([(tbl) => OrderingTerm.asc(tbl.id)]))
            .get();
    return rows.map(_mapAttachment).toList();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'ponymail.sqlite'));
    return NativeDatabase(file);
  });
}
