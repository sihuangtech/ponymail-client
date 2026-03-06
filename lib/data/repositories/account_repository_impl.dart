import 'package:drift/drift.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/utils/result.dart';
import '../database/database.dart';
import '../datasources/local/demo_mail_local_source.dart';
import '../models/account_model.dart';
import 'account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl(
    this._database,
    this._secureStorage,
    this._demoSource,
  );

  final AppDatabase _database;
  final FlutterSecureStorage _secureStorage;
  final DemoMailLocalSource _demoSource;

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
              imapSsl: Value(account.imapSsl),
              smtpHost: account.smtpHost,
              smtpPort: account.smtpPort,
              smtpSsl: Value(account.smtpSsl),
              passwordKey: account.passwordKey,
              color: account.color,
              signature: Value(account.signature),
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
      final accounts = await _database.getAccountModels();
      return Result.ok(accounts);
    } catch (e) {
      return Result.err('查询账户失败: $e');
    }
  }

  @override
  Future<Result<void>> seedDemoAccounts() async {
    try {
      final accounts = _demoSource.buildAccounts();
      await _database.replaceAccounts(accounts);
      for (final account in accounts) {
        await _secureStorage.write(
          key: account.passwordKey,
          value: 'demo-password',
        );
      }
      return Result.ok(null);
    } catch (e) {
      return Result.err('初始化演示账户失败: $e');
    }
  }
}
