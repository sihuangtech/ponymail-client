import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/account_model.dart';

class AccountNotifier extends AsyncNotifier<List<AccountModel>> {
  @override
  Future<List<AccountModel>> build() async => [];

  Future<void> selectAccount(AccountModel account) async {
    state = AsyncData([account]);
  }
}

final accountProvider = AsyncNotifierProvider<AccountNotifier, List<AccountModel>>(AccountNotifier.new);
