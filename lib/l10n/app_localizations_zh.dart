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
  String get notificationSettingsHint => '控制本地邮件提醒与权限请求。';

  @override
  String get notificationPermission => '通知权限';

  @override
  String get notificationPermissionHint => '向系统申请本设备上的通知权限。';

  @override
  String get requestPermission => '申请';

  @override
  String get permissionRequestSent => '已发起权限请求';

  @override
  String get backgroundSync => '后台同步';

  @override
  String get backgroundSyncHint => '保存后台同步策略偏好，供后续后台任务接入。';

  @override
  String get idlePush => 'IDLE / 推送同步';

  @override
  String get idlePushHint => '在运行时连接可用时保持实时同步。';

  @override
  String get restoreScheduledSends => '恢复定时发送';

  @override
  String get restoreScheduledSendsHint => 'App 重启后重新加载已排队的定时邮件。';

  @override
  String get signature => '签名';

  @override
  String get cache => '缓存';

  @override
  String get manageAccounts => '账户管理';

  @override
  String get addAccount => '新增账户';

  @override
  String get editAccount => '编辑账户';

  @override
  String get saveAccount => '保存账户';

  @override
  String get saving => '保存中...';

  @override
  String get accountName => '账户名称';

  @override
  String get emailAddress => '邮箱地址';

  @override
  String get password => '密码';

  @override
  String get autoDiscoverSettings => '自动发现配置';

  @override
  String get accountDiscoveryApplied => '已应用服务器配置';

  @override
  String get accountDiscoveryGuessApplied => '已应用推测配置';

  @override
  String get accountDiscoveryInvalidEmail => '请先输入有效邮箱地址';

  @override
  String get serverSettings => '服务器设置';

  @override
  String get useSslForImap => 'IMAP 使用 SSL';

  @override
  String get useSslForSmtp => 'SMTP 使用 SSL';

  @override
  String get requiredField => '此项不能为空';

  @override
  String get invalidPort => '请输入有效端口';

  @override
  String get deleteAccount => '删除账户';

  @override
  String get deleteAccountConfirm => '删除该账户及其已保存凭据？';

  @override
  String get cancel => '取消';

  @override
  String get systemDefault => '跟随系统';

  @override
  String get enabled => '已开启';

  @override
  String get clearCache => '清理缓存';

  @override
  String get scheduledQueue => '定时队列';

  @override
  String get scheduledQueueHint => '已计划发送的邮件会显示在这里。';

  @override
  String get noScheduledEmails => '暂无定时邮件';

  @override
  String get cancelSchedule => '取消计划';

  @override
  String get noSubject => '（无主题）';

  @override
  String get lastError => '最近错误';

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
