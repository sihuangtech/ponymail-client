import 'package:flutter_test/flutter_test.dart';
import 'package:ponymail/data/models/app_preferences.dart';

void main() {
  test('AppPreferences round-trips through json', () {
    const value = AppPreferences(
      notificationsEnabled: false,
      backgroundSyncEnabled: true,
      idlePushEnabled: true,
      restoreScheduledSends: false,
    );

    final decoded = AppPreferences.fromJson(value.toJson());

    expect(decoded.notificationsEnabled, isFalse);
    expect(decoded.backgroundSyncEnabled, isTrue);
    expect(decoded.idlePushEnabled, isTrue);
    expect(decoded.restoreScheduledSends, isFalse);
  });
}
