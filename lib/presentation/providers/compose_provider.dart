import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/compose_request.dart';
import '../../data/models/email_model.dart';
import 'app_providers.dart';

final scheduledAtProvider = StateProvider<DateTime?>((ref) => null);

class ComposeNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> send(ComposeRequest request) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(scheduledSendServiceProvider).schedule(
        request,
        (payload) async {
          final result = await ref.read(mailRepositoryProvider).sendEmail(payload);
          if (!result.isSuccess) {
            throw Exception(result.failure?.message ?? 'send failed');
          }
        },
      );
    });
  }

  List<EmailAddressModel> parseAddresses(String text) {
    return text
        .split(',')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .map((item) => EmailAddressModel(name: '', email: item))
        .toList();
  }
}

final composeProvider =
    AsyncNotifierProvider<ComposeNotifier, void>(ComposeNotifier.new);
