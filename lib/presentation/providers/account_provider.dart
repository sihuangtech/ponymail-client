import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/account_model.dart';
import 'app_providers.dart';

class SelectedAccountNotifier extends Notifier<int?> {
  @override
  int? build() => null;

  void select(int? id) => state = id;
}

final selectedAccountIdProvider =
    NotifierProvider<SelectedAccountNotifier, int?>(
      SelectedAccountNotifier.new,
    );

class AccountNotifier extends AsyncNotifier<List<AccountModel>> {
  @override
  Future<List<AccountModel>> build() async {
    return _loadAccounts();
  }

  Future<List<AccountModel>> _loadAccounts() async {
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

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadAccounts);
  }

  Future<void> selectAccount(int? accountId) async {
    ref.read(selectedAccountIdProvider.notifier).select(accountId);
  }

  Future<String?> getPassword(AccountModel account) async {
    final repository = ref.read(accountRepositoryProvider);
    final result = await repository.getPassword(account);
    return result.data;
  }

  Future<String?> addAccount(AccountModel account, String password) async {
    final repository = ref.read(accountRepositoryProvider);
    final result = await repository.addAccount(account, password);
    if (!result.isSuccess) {
      return result.failure?.message;
    }
    await refresh();
    final added = result.data;
    if (added != null) {
      ref.read(selectedAccountIdProvider.notifier).select(added.id);
    }
    return null;
  }

  Future<String?> updateAccount(AccountModel account, String password) async {
    final repository = ref.read(accountRepositoryProvider);
    final result = await repository.updateAccount(account, password);
    if (!result.isSuccess) {
      return result.failure?.message;
    }
    await refresh();
    ref.read(selectedAccountIdProvider.notifier).select(account.id);
    return null;
  }

  Future<String?> deleteAccount(int accountId) async {
    final repository = ref.read(accountRepositoryProvider);
    final previousSelectedId = ref.read(selectedAccountIdProvider);
    final result = await repository.deleteAccount(accountId);
    if (!result.isSuccess) {
      return result.failure?.message;
    }
    await refresh();
    final accounts = state.value ?? const <AccountModel>[];
    if (accounts.isEmpty) {
      ref.read(selectedAccountIdProvider.notifier).select(null);
    } else if (previousSelectedId == accountId) {
      ref.read(selectedAccountIdProvider.notifier).select(accounts.first.id);
    }
    return null;
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
