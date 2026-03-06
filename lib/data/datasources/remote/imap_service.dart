import 'package:enough_mail/enough_mail.dart';

import '../../../core/utils/result.dart';
import '../../models/account_model.dart';

class ImapService {
  Future<Result<ClientConfig>> discover(String email) async {
    try {
      final config = await Discover.discover(email);
      if (config == null) return Result.err('未发现服务器配置');
      return Result.ok(config);
    } catch (e) {
      return Result.err('自动发现失败: $e');
    }
  }

  Future<Result<MailClient>> connect(AccountModel account, String password) async {
    try {
      final client = MailClient('ponymail');
      await client.connectToServer(
        account.imapHost,
        account.imapPort,
        isSecure: account.imapSsl,
      );
      await client.login(account.email, password);
      return Result.ok(client);
    } catch (e) {
      return Result.err('IMAP 连接失败: $e');
    }
  }
}
