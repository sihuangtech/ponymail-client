import 'package:flutter_test/flutter_test.dart';
import 'package:ponymail/data/services/account_auto_discovery_service.dart';

void main() {
  final service = AccountAutoDiscoveryService();

  test('returns exact preset for common domains', () {
    final result = service.discover('alice@gmail.com');

    expect(result, isNotNull);
    expect(result!.imapHost, 'imap.gmail.com');
    expect(result.smtpHost, 'smtp.gmail.com');
    expect(result.isExactMatch, isTrue);
  });

  test('falls back to domain-based guess for custom domains', () {
    final result = service.discover('team@mail.example.com');

    expect(result, isNotNull);
    expect(result!.imapHost, 'imap.mail.example.com');
    expect(result.smtpHost, 'smtp.mail.example.com');
    expect(result.isExactMatch, isFalse);
  });

  test('returns null for invalid email', () {
    expect(service.discover('invalid-email'), isNull);
  });
}
