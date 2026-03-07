class AppPreferences {
  const AppPreferences({
    this.notificationsEnabled = true,
    this.backgroundSyncEnabled = false,
    this.idlePushEnabled = false,
    this.restoreScheduledSends = true,
  });

  final bool notificationsEnabled;
  final bool backgroundSyncEnabled;
  final bool idlePushEnabled;
  final bool restoreScheduledSends;

  AppPreferences copyWith({
    bool? notificationsEnabled,
    bool? backgroundSyncEnabled,
    bool? idlePushEnabled,
    bool? restoreScheduledSends,
  }) {
    return AppPreferences(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      backgroundSyncEnabled:
          backgroundSyncEnabled ?? this.backgroundSyncEnabled,
      idlePushEnabled: idlePushEnabled ?? this.idlePushEnabled,
      restoreScheduledSends:
          restoreScheduledSends ?? this.restoreScheduledSends,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'notificationsEnabled': notificationsEnabled,
      'backgroundSyncEnabled': backgroundSyncEnabled,
      'idlePushEnabled': idlePushEnabled,
      'restoreScheduledSends': restoreScheduledSends,
    };
  }

  factory AppPreferences.fromJson(Map<String, dynamic> json) {
    return AppPreferences(
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      backgroundSyncEnabled: json['backgroundSyncEnabled'] as bool? ?? false,
      idlePushEnabled: json['idlePushEnabled'] as bool? ?? false,
      restoreScheduledSends: json['restoreScheduledSends'] as bool? ?? true,
    );
  }
}
