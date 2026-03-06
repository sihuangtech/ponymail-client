import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/utils/result.dart';
import '../database/database.dart';
import '../models/account_model.dart';
import 'account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl(this._database, this._secureStorage);

  final AppDatabase _database;
  final FlutterSecureStorage _secureStorage;

  @override
  Future<Result<AccountModel>> addAccount(AccountModel account, String password) async {
    try {
      await _secureStorage.write(key: account.passwordKey, value: password);
      final id = await _database.into(_database.accounts).insert(
            AccountsCompanion.insert(
              email: account.email,
              displayName: account.displayName,
              imapHost: account.imapHost,
              imapPort: account.imapPort,
              imapSsl: account.imapSsl,
              smtpHost: account.smtpHost,
              smtpPort: account.smtpPort,
              smtpSsl: account.smtpSsl,
              passwordKey: account.passwordKey,
              color: account.color,
              signature: account.signature,
            ),
          );
      return Result.ok(account.copyWith(id: id));
    } catch (e) {
      return Result.err('添加账户失败: $e');
    }
  }

  @override
  Future<Result<void>> deleteAccount(int accountId) async {
    try {
      await (_database.delete(_database.accounts)..where((tbl) => tbl.id.equals(accountId))).go();
      return Result.ok(null);
    } catch (e) {
      return Result.err('删除账户失败: $e');
    }
  }

  @override
  Future<Result<List<AccountModel>>> getAccounts() async {
    try {
      final rows = await _database.select(_database.accounts).get();
      final accounts = rows
          .map(
            (row) => AccountModel(
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
            ),
          )
          .toList();
      return Result.ok(accounts);
    } catch (e) {
      return Result.err('查询账户失败: $e');
    }
  }
}
