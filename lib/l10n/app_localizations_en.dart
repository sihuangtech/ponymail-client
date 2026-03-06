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
  String get signature => 'Signature';

  @override
  String get cache => 'Cache';

  @override
  String get manageAccounts => 'Manage Accounts';

  @override
  String get systemDefault => 'Follow system';

  @override
  String get enabled => 'Enabled';

  @override
  String get clearCache => 'Clear cache';

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
