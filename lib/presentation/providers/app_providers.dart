import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/database.dart';
import '../../data/datasources/local/demo_mail_local_source.dart';
import '../../data/datasources/remote/imap_service.dart';
import '../../data/repositories/account_repository.dart';
import '../../data/repositories/account_repository_impl.dart';
import '../../data/repositories/mail_repository.dart';
import '../../data/repositories/mail_repository_impl.dart';
import '../../domain/usecases/sync_inbox_usecase.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final secureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(),
);

final demoMailSourceProvider = Provider<DemoMailLocalSource>(
  (ref) => DemoMailLocalSource(),
);

final imapServiceProvider = Provider<ImapService>((ref) => ImapService());

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepositoryImpl(
    ref.watch(appDatabaseProvider),
    ref.watch(secureStorageProvider),
    ref.watch(demoMailSourceProvider),
  );
});

final mailRepositoryProvider = Provider<MailRepository>((ref) {
  return MailRepositoryImpl(
    ref.watch(appDatabaseProvider),
    ref.watch(demoMailSourceProvider),
  );
});

final syncInboxUseCaseProvider = Provider<SyncInboxUseCase>((ref) {
  return SyncInboxUseCase(
    ref.watch(imapServiceProvider),
    ref.watch(appDatabaseProvider),
  );
});
