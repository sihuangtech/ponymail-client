import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'PonyMail'**
  String get appTitle;

  /// No description provided for @splashTitle.
  ///
  /// In en, this message translates to:
  /// **'PonyMail'**
  String get splashTitle;

  /// No description provided for @onboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first mailbox'**
  String get onboardingTitle;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use auto-discovery or enter IMAP/SMTP settings manually.'**
  String get onboardingSubtitle;

  /// No description provided for @continueToInbox.
  ///
  /// In en, this message translates to:
  /// **'Continue to inbox'**
  String get continueToInbox;

  /// No description provided for @allInboxes.
  ///
  /// In en, this message translates to:
  /// **'All Inboxes'**
  String get allInboxes;

  /// No description provided for @inbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inbox;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @compose.
  ///
  /// In en, this message translates to:
  /// **'Compose'**
  String get compose;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @writeEmail.
  ///
  /// In en, this message translates to:
  /// **'Write Email'**
  String get writeEmail;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @cc.
  ///
  /// In en, this message translates to:
  /// **'Cc'**
  String get cc;

  /// No description provided for @bcc.
  ///
  /// In en, this message translates to:
  /// **'Bcc'**
  String get bcc;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @body.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get body;

  /// No description provided for @addAttachment.
  ///
  /// In en, this message translates to:
  /// **'Add attachment'**
  String get addAttachment;

  /// No description provided for @scheduleSend.
  ///
  /// In en, this message translates to:
  /// **'Schedule send'**
  String get scheduleSend;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @draftSaved.
  ///
  /// In en, this message translates to:
  /// **'Draft auto-saved'**
  String get draftSaved;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search subject or sender'**
  String get searchHint;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeMode;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Control local mail alerts and permission requests.'**
  String get notificationSettingsHint;

  /// No description provided for @notificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Notification permission'**
  String get notificationPermission;

  /// No description provided for @notificationPermissionHint.
  ///
  /// In en, this message translates to:
  /// **'Ask the system for alert permission on this device.'**
  String get notificationPermissionHint;

  /// No description provided for @requestPermission.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get requestPermission;

  /// No description provided for @permissionRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Permission request submitted'**
  String get permissionRequestSent;

  /// No description provided for @backgroundSync.
  ///
  /// In en, this message translates to:
  /// **'Background sync'**
  String get backgroundSync;

  /// No description provided for @backgroundSyncHint.
  ///
  /// In en, this message translates to:
  /// **'Store your preferred background sync strategy for a future worker.'**
  String get backgroundSyncHint;

  /// No description provided for @idlePush.
  ///
  /// In en, this message translates to:
  /// **'IDLE / push sync'**
  String get idlePush;

  /// No description provided for @idlePushHint.
  ///
  /// In en, this message translates to:
  /// **'Keep real-time sync enabled when a runtime connection is available.'**
  String get idlePushHint;

  /// No description provided for @restoreScheduledSends.
  ///
  /// In en, this message translates to:
  /// **'Restore scheduled sends'**
  String get restoreScheduledSends;

  /// No description provided for @restoreScheduledSendsHint.
  ///
  /// In en, this message translates to:
  /// **'Reload queued scheduled emails after the app restarts.'**
  String get restoreScheduledSendsHint;

  /// No description provided for @signature.
  ///
  /// In en, this message translates to:
  /// **'Signature'**
  String get signature;

  /// No description provided for @cache.
  ///
  /// In en, this message translates to:
  /// **'Cache'**
  String get cache;

  /// No description provided for @manageAccounts.
  ///
  /// In en, this message translates to:
  /// **'Manage Accounts'**
  String get manageAccounts;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get addAccount;

  /// No description provided for @editAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit account'**
  String get editAccount;

  /// No description provided for @saveAccount.
  ///
  /// In en, this message translates to:
  /// **'Save account'**
  String get saveAccount;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @accountName.
  ///
  /// In en, this message translates to:
  /// **'Account name'**
  String get accountName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @autoDiscoverSettings.
  ///
  /// In en, this message translates to:
  /// **'Auto-discover settings'**
  String get autoDiscoverSettings;

  /// No description provided for @accountDiscoveryApplied.
  ///
  /// In en, this message translates to:
  /// **'Applied server settings'**
  String get accountDiscoveryApplied;

  /// No description provided for @accountDiscoveryGuessApplied.
  ///
  /// In en, this message translates to:
  /// **'Applied guessed server settings'**
  String get accountDiscoveryGuessApplied;

  /// No description provided for @accountDiscoveryInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address first'**
  String get accountDiscoveryInvalidEmail;

  /// No description provided for @serverSettings.
  ///
  /// In en, this message translates to:
  /// **'Server settings'**
  String get serverSettings;

  /// No description provided for @useSslForImap.
  ///
  /// In en, this message translates to:
  /// **'Use SSL for IMAP'**
  String get useSslForImap;

  /// No description provided for @useSslForSmtp.
  ///
  /// In en, this message translates to:
  /// **'Use SSL for SMTP'**
  String get useSslForSmtp;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @invalidPort.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid port'**
  String get invalidPort;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this account and its stored credentials?'**
  String get deleteAccountConfirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get systemDefault;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear cache'**
  String get clearCache;

  /// No description provided for @cacheLoading.
  ///
  /// In en, this message translates to:
  /// **'Calculating cache usage...'**
  String get cacheLoading;

  /// No description provided for @cacheCleared.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared'**
  String get cacheCleared;

  /// No description provided for @cacheSummary.
  ///
  /// In en, this message translates to:
  /// **'{count} files · {size}'**
  String cacheSummary(Object count, Object size);

  /// No description provided for @cachedLocally.
  ///
  /// In en, this message translates to:
  /// **'Cached locally'**
  String get cachedLocally;

  /// No description provided for @scheduledQueue.
  ///
  /// In en, this message translates to:
  /// **'Scheduled queue'**
  String get scheduledQueue;

  /// No description provided for @scheduledQueueHint.
  ///
  /// In en, this message translates to:
  /// **'Scheduled emails will appear here once queued.'**
  String get scheduledQueueHint;

  /// No description provided for @noScheduledEmails.
  ///
  /// In en, this message translates to:
  /// **'No scheduled emails'**
  String get noScheduledEmails;

  /// No description provided for @cancelSchedule.
  ///
  /// In en, this message translates to:
  /// **'Cancel schedule'**
  String get cancelSchedule;

  /// No description provided for @noSubject.
  ///
  /// In en, this message translates to:
  /// **'(No subject)'**
  String get noSubject;

  /// No description provided for @lastError.
  ///
  /// In en, this message translates to:
  /// **'Last error'**
  String get lastError;

  /// No description provided for @signatureDefault.
  ///
  /// In en, this message translates to:
  /// **'Sent from PonyMail'**
  String get signatureDefault;

  /// No description provided for @previewPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select an email to preview'**
  String get previewPlaceholder;

  /// No description provided for @loadingFailed.
  ///
  /// In en, this message translates to:
  /// **'Load failed: {error}'**
  String loadingFailed(Object error);

  /// No description provided for @emptyInbox.
  ///
  /// In en, this message translates to:
  /// **'No cached mail yet'**
  String get emptyInbox;

  /// No description provided for @sampleHtmlTitle.
  ///
  /// In en, this message translates to:
  /// **'Rendered HTML email'**
  String get sampleHtmlTitle;

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// No description provided for @selectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String selectedCount(Object count);

  /// No description provided for @batchMove.
  ///
  /// In en, this message translates to:
  /// **'Move'**
  String get batchMove;

  /// No description provided for @batchDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete the selected emails?'**
  String get batchDeleteConfirm;

  /// No description provided for @markUnread.
  ///
  /// In en, this message translates to:
  /// **'Mark unread'**
  String get markUnread;

  /// No description provided for @markRead.
  ///
  /// In en, this message translates to:
  /// **'Mark read'**
  String get markRead;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @star.
  ///
  /// In en, this message translates to:
  /// **'Star'**
  String get star;

  /// No description provided for @unstar.
  ///
  /// In en, this message translates to:
  /// **'Unstar'**
  String get unstar;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
