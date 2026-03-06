import 'package:flutter_test/flutter_test.dart';
import 'package:ponymail/data/datasources/local/demo_mail_local_source.dart';

void main() {
  final source = DemoMailLocalSource();

  test('buildAccounts returns multiple accounts', () {
    final accounts = source.buildAccounts();
    expect(accounts.length, greaterThanOrEqualTo(2));
    expect(accounts.first.email, contains('@'));
  });

  test('buildEmails returns inbox messages with previews', () {
    final emails = source.buildEmails();
    expect(emails, isNotEmpty);
    expect(emails.first.preview, isNotEmpty);
    expect(emails.first.mailbox, 'INBOX');
  });
}
