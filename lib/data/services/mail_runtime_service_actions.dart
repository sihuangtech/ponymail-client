part of 'mail_runtime_service.dart';

extension MailRuntimeServiceActions on MailRuntimeService {
  Future<void> markRead(
    AccountModel account,
    String password,
    EmailModel email,
    bool read,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    final sequence = MessageSequence.fromIds([
      email.remoteUid ?? 0,
    ], isUid: true);
    if (read) {
      await client.markSeen(sequence);
    } else {
      await client.markUnseen(sequence);
    }
  }

  Future<void> markStarred(
    AccountModel account,
    String password,
    EmailModel email,
    bool starred,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    final sequence = MessageSequence.fromIds([
      email.remoteUid ?? 0,
    ], isUid: true);
    if (starred) {
      await client.markFlagged(sequence);
    } else {
      await client.markUnflagged(sequence);
    }
  }

  Future<void> deleteMessage(
    AccountModel account,
    String password,
    EmailModel email,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    await client.deleteMessages(
      MessageSequence.fromIds([email.remoteUid ?? 0], isUid: true),
    );
  }

  Future<void> moveMessage(
    AccountModel account,
    String password,
    EmailModel email,
    MailboxModel target,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    final boxes = await client.listMailboxes();
    final mailbox = boxes.firstWhere((item) => item.path == target.path);
    await client.moveMessages(
      MessageSequence.fromIds([email.remoteUid ?? 0], isUid: true),
      mailbox,
    );
  }

  Future<void> sendMessage(
    AccountModel account,
    String password,
    ComposeRequest request,
  ) async {
    final client = await connect(account, password);
    final builder =
        MessageBuilder.prepareMultipartAlternativeMessage(
            plainText: request.bodyPlain,
            htmlText: request.bodyHtml,
          )
          ..from = [MailAddress(account.email, account.displayName)]
          ..to = _addresses(request.to)
          ..cc = _addresses(request.cc)
          ..bcc = _addresses(request.bcc)
          ..subject = request.subject;
    for (final path in request.attachmentPaths) {
      final file = File(path);
      await builder.addFile(file, MediaType.guessFromFileName(path));
    }
    await client.sendMessageBuilder(builder);
  }

  Future<List<AttachmentModel>> fetchAttachments(
    AccountModel account,
    String password,
    EmailModel email,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    final messages = await client.searchMessages(
      MailSearch(email.messageId, SearchQueryType.allTextHeaders, pageSize: 1),
    );
    if (messages.messages.isEmpty) {
      return const [];
    }
    final full = await client.fetchMessageContents(messages.messages.first);
    return _mapper.toAttachmentModels(full, emailId: email.id);
  }

  Future<String?> downloadAttachment(
    AccountModel account,
    String password,
    EmailModel email,
    AttachmentModel attachment, {
    String? savePath,
  }) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    final result = await client.searchMessages(
      MailSearch(email.messageId, SearchQueryType.allTextHeaders, pageSize: 1),
    );
    if (result.messages.isEmpty) {
      return null;
    }
    final full = await client.fetchMessageContents(result.messages.first);
    final parts = full.findContentInfo();
    final target = parts.firstWhere(
      (part) => (part.fileName ?? '') == attachment.filename,
      orElse: () => parts.first,
    );
    final mimePart = await client.fetchMessagePart(full, target.fetchId);
    final bytes = mimePart.decodeContentBinary();
    if (bytes == null) {
      return null;
    }
    final file = File(
      savePath ??
          p.join(
            (await getApplicationDocumentsDirectory()).path,
            attachment.filename,
          ),
    );
    await file.parent.create(recursive: true);
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  List<MailAddress> _addresses(List<EmailAddressModel> values) {
    return values.map((item) => MailAddress(item.email, item.name)).toList();
  }
}
