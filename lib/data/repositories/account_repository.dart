import '../models/account_model.dart';
import '../../core/utils/result.dart';

abstract class AccountRepository {
  Future<Result<AccountModel>> addAccount(AccountModel account, String password);
  Future<Result<List<AccountModel>>> getAccounts();
  Future<Result<AccountModel>> updateAccount(AccountModel account, String password);
  Future<Result<void>> deleteAccount(int accountId);
  Future<Result<String>> getPassword(AccountModel account);
  Future<Result<void>> seedDemoAccounts();
}
