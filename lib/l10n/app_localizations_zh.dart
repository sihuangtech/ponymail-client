// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '小马邮箱';

  @override
  String get splashTitle => '小马邮箱';

  @override
  String get onboardingTitle => '添加你的第一个邮箱';

  @override
  String get onboardingSubtitle => '支持自动发现，也支持手动填写 IMAP/SMTP 配置。';

  @override
  String get continueToInbox => '进入收件箱';

  @override
  String get allInboxes => '统一收件箱';

  @override
  String get inbox => '收件箱';

  @override
  String get search => '搜索';

  @override
  String get compose => '写邮件';

  @override
  String get settings => '设置';

  @override
  String get writeEmail => '写邮件';

  @override
  String get to => '收件人';

  @override
  String get cc => '抄送';

  @override
  String get bcc => '密送';

  @override
  String get subject => '主题';

  @override
  String get body => '正文';

  @override
  String get addAttachment => '添加附件';

  @override
  String get scheduleSend => '定时发送';

  @override
  String get send => '发送';

  @override
  String get draftSaved => '草稿已自动保存';

  @override
  String get searchHint => '搜索主题或发件人';

  @override
  String get themeMode => '主题';

  @override
  String get notifications => '通知';

  @override
  String get signature => '签名';

  @override
  String get cache => '缓存';

  @override
  String get manageAccounts => '账户管理';

  @override
  String get systemDefault => '跟随系统';

  @override
  String get enabled => '已开启';

  @override
  String get clearCache => '清理缓存';

  @override
  String get signatureDefault => 'Sent from PonyMail';

  @override
  String get previewPlaceholder => '选择一封邮件进行预览';

  @override
  String loadingFailed(Object error) {
    return '加载失败：$error';
  }

  @override
  String get emptyInbox => '还没有缓存邮件';

  @override
  String get sampleHtmlTitle => 'HTML 邮件渲染示例';

  @override
  String get reply => '回复';

  @override
  String get markUnread => '标为未读';

  @override
  String get markRead => '标为已读';

  @override
  String get archive => '归档';

  @override
  String get delete => '删除';

  @override
  String get star => '星标';

  @override
  String get unstar => '取消星标';
}
