// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'PonyMail';

  @override
  String get splashTitle => 'PonyMail';

  @override
  String get onboardingTitle => 'Add your first mailbox';

  @override
  String get onboardingSubtitle =>
      'Use auto-discovery or enter IMAP/SMTP settings manually.';

  @override
  String get continueToInbox => 'Continue to inbox';

  @override
  String get allInboxes => 'All Inboxes';

  @override
  String get inbox => 'Inbox';

  @override
  String get search => 'Search';

  @override
  String get compose => 'Compose';

  @override
  String get settings => 'Settings';

  @override
  String get writeEmail => 'Write Email';

  @override
  String get to => 'To';

  @override
  String get cc => 'Cc';

  @override
  String get bcc => 'Bcc';

  @override
  String get subject => 'Subject';

  @override
  String get body => 'Body';

  @override
  String get addAttachment => 'Add attachment';

  @override
  String get scheduleSend => 'Schedule send';

  @override
  String get send => 'Send';

  @override
  String get draftSaved => 'Draft auto-saved';

  @override
  String get searchHint => 'Search subject or sender';

  @override
  String get themeMode => 'Theme';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationSettingsHint =>
      'Control local mail alerts and permission requests.';

  @override
  String get notificationPermission => 'Notification permission';

  @override
  String get notificationPermissionHint =>
      'Ask the system for alert permission on this device.';

  @override
  String get requestPermission => 'Request';

  @override
  String get permissionRequestSent => 'Permission request submitted';

  @override
  String get backgroundSync => 'Background sync';

  @override
  String get backgroundSyncHint =>
      'Store your preferred background sync strategy for a future worker.';

  @override
  String get idlePush => 'IDLE / push sync';

  @override
  String get idlePushHint =>
      'Keep real-time sync enabled when a runtime connection is available.';

  @override
  String get restoreScheduledSends => 'Restore scheduled sends';

  @override
  String get restoreScheduledSendsHint =>
      'Reload queued scheduled emails after the app restarts.';

  @override
  String get signature => 'Signature';

  @override
  String get cache => 'Cache';

  @override
  String get manageAccounts => 'Manage Accounts';

  @override
  String get addAccount => 'Add account';

  @override
  String get editAccount => 'Edit account';

  @override
  String get saveAccount => 'Save account';

  @override
  String get saving => 'Saving...';

  @override
  String get accountName => 'Account name';

  @override
  String get emailAddress => 'Email address';

  @override
  String get password => 'Password';

  @override
  String get autoDiscoverSettings => 'Auto-discover settings';

  @override
  String get accountDiscoveryApplied => 'Applied server settings';

  @override
  String get accountDiscoveryGuessApplied => 'Applied guessed server settings';

  @override
  String get accountDiscoveryInvalidEmail =>
      'Enter a valid email address first';

  @override
  String get serverSettings => 'Server settings';

  @override
  String get useSslForImap => 'Use SSL for IMAP';

  @override
  String get useSslForSmtp => 'Use SSL for SMTP';

  @override
  String get requiredField => 'This field is required';

  @override
  String get invalidPort => 'Enter a valid port';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteAccountConfirm =>
      'Delete this account and its stored credentials?';

  @override
  String get cancel => 'Cancel';

  @override
  String get systemDefault => 'Follow system';

  @override
  String get enabled => 'Enabled';

  @override
  String get clearCache => 'Clear cache';

  @override
  String get scheduledQueue => 'Scheduled queue';

  @override
  String get scheduledQueueHint =>
      'Scheduled emails will appear here once queued.';

  @override
  String get noScheduledEmails => 'No scheduled emails';

  @override
  String get cancelSchedule => 'Cancel schedule';

  @override
  String get noSubject => '(No subject)';

  @override
  String get lastError => 'Last error';

  @override
  String get signatureDefault => 'Sent from PonyMail';

  @override
  String get previewPlaceholder => 'Select an email to preview';

  @override
  String loadingFailed(Object error) {
    return 'Load failed: $error';
  }

  @override
  String get emptyInbox => 'No cached mail yet';

  @override
  String get sampleHtmlTitle => 'Rendered HTML email';

  @override
  String get reply => 'Reply';

  @override
  String get markUnread => 'Mark unread';

  @override
  String get markRead => 'Mark read';

  @override
  String get archive => 'Archive';

  @override
  String get delete => 'Delete';

  @override
  String get star => 'Star';

  @override
  String get unstar => 'Unstar';
}
