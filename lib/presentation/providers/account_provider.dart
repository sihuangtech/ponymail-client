import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/account_model.dart';
import 'app_providers.dart';

class SelectedAccountNotifier extends Notifier<int?> {
  @override
  int? build() => null;

  void select(int? id) => state = id;
}

final selectedAccountIdProvider =
    NotifierProvider<SelectedAccountNotifier, int?>(SelectedAccountNotifier.new);

class AccountNotifier extends AsyncNotifier<List<AccountModel>> {
  @override
  Future<List<AccountModel>> build() async {
    final repository = ref.watch(accountRepositoryProvider);
    var result = await repository.getAccounts();
    if ((result.data ?? []).isEmpty) {
      await repository.seedDemoAccounts();
      result = await repository.getAccounts();
    }
    final accounts = result.data ?? const <AccountModel>[];
    if (accounts.isNotEmpty && ref.read(selectedAccountIdProvider) == null) {
      ref.read(selectedAccountIdProvider.notifier).select(accounts.first.id);
    }
    return accounts;
  }

  Future<void> selectAccount(int? accountId) async {
    ref.read(selectedAccountIdProvider.notifier).select(accountId);
  }
}

final accountProvider =
    AsyncNotifierProvider<AccountNotifier, List<AccountModel>>(
  AccountNotifier.new,
);

final currentAccountProvider = Provider<AccountModel?>((ref) {
  final accounts = ref.watch(accountProvider).value ?? const <AccountModel>[];
  final selectedId = ref.watch(selectedAccountIdProvider);
  if (selectedId == null) {
    return null;
  }
  for (final account in accounts) {
    if (account.id == selectedId) {
      return account;
    }
  }
  return null;
});
