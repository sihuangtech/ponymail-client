import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/email_model.dart';

class InboxNotifier extends AsyncNotifier<List<EmailModel>> {
  @override
  Future<List<EmailModel>> build() async => [];

  Future<void> refreshInbox() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => state.value ?? []);
  }
}

final inboxProvider = AsyncNotifierProvider<InboxNotifier, List<EmailModel>>(InboxNotifier.new);
