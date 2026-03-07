import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'app_preferences_service.dart';

class NotificationService {
  NotificationService(this._preferencesService);

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  final AppPreferencesService _preferencesService;

  Future<void> initialize() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwin = DarwinInitializationSettings();
    const settings = InitializationSettings(
      android: android,
      iOS: darwin,
      macOS: darwin,
    );
    await _plugin.initialize(settings: settings);
  }

  Future<void> requestPermissions() async {
    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
    await _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
    await _plugin
        .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> showNewMail({
    required int id,
    required String title,
    required String body,
  }) async {
    final preferences = await _preferencesService.load();
    if (!preferences.notificationsEnabled) {
      return;
    }
    const android = AndroidNotificationDetails(
      'mail_sync',
      'Mail Sync',
      channelDescription: 'New mail notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    const details = NotificationDetails(
      android: android,
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
    );
    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }
}
