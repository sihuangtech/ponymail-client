import '../models/account_model.dart';
import '../../core/utils/result.dart';

abstract class AccountRepository {
  Future<Result<AccountModel>> addAccount(AccountModel account, String password);
  Future<Result<List<AccountModel>>> getAccounts();
  Future<Result<void>> deleteAccount(int accountId);
}
