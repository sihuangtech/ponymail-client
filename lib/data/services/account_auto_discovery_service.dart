class AutoDiscoverySettings {
  const AutoDiscoverySettings({
    required this.imapHost,
    required this.imapPort,
    required this.imapSsl,
    required this.smtpHost,
    required this.smtpPort,
    required this.smtpSsl,
    required this.source,
    required this.isExactMatch,
  });

  final String imapHost;
  final int imapPort;
  final bool imapSsl;
  final String smtpHost;
  final int smtpPort;
  final bool smtpSsl;
  final String source;
  final bool isExactMatch;
}

class AccountAutoDiscoveryService {
  static const Map<String, AutoDiscoverySettings> _presets =
      <String, AutoDiscoverySettings>{
        'gmail.com': AutoDiscoverySettings(
          imapHost: 'imap.gmail.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.gmail.com',
          smtpPort: 465,
          smtpSsl: true,
          source: 'Gmail preset',
          isExactMatch: true,
        ),
        'outlook.com': AutoDiscoverySettings(
          imapHost: 'outlook.office365.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.office365.com',
          smtpPort: 587,
          smtpSsl: false,
          source: 'Outlook preset',
          isExactMatch: true,
        ),
        'hotmail.com': AutoDiscoverySettings(
          imapHost: 'outlook.office365.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.office365.com',
          smtpPort: 587,
          smtpSsl: false,
          source: 'Outlook preset',
          isExactMatch: true,
        ),
        'live.com': AutoDiscoverySettings(
          imapHost: 'outlook.office365.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.office365.com',
          smtpPort: 587,
          smtpSsl: false,
          source: 'Outlook preset',
          isExactMatch: true,
        ),
        'icloud.com': AutoDiscoverySettings(
          imapHost: 'imap.mail.me.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.mail.me.com',
          smtpPort: 587,
          smtpSsl: false,
          source: 'iCloud preset',
          isExactMatch: true,
        ),
        'me.com': AutoDiscoverySettings(
          imapHost: 'imap.mail.me.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.mail.me.com',
          smtpPort: 587,
          smtpSsl: false,
          source: 'iCloud preset',
          isExactMatch: true,
        ),
        'qq.com': AutoDiscoverySettings(
          imapHost: 'imap.qq.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.qq.com',
          smtpPort: 465,
          smtpSsl: true,
          source: 'QQ Mail preset',
          isExactMatch: true,
        ),
        '163.com': AutoDiscoverySettings(
          imapHost: 'imap.163.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.163.com',
          smtpPort: 465,
          smtpSsl: true,
          source: 'NetEase 163 preset',
          isExactMatch: true,
        ),
        '126.com': AutoDiscoverySettings(
          imapHost: 'imap.126.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.126.com',
          smtpPort: 465,
          smtpSsl: true,
          source: 'NetEase 126 preset',
          isExactMatch: true,
        ),
        'yahoo.com': AutoDiscoverySettings(
          imapHost: 'imap.mail.yahoo.com',
          imapPort: 993,
          imapSsl: true,
          smtpHost: 'smtp.mail.yahoo.com',
          smtpPort: 465,
          smtpSsl: true,
          source: 'Yahoo preset',
          isExactMatch: true,
        ),
      };

  AutoDiscoverySettings? discover(String email) {
    final normalized = email.trim().toLowerCase();
    final atIndex = normalized.indexOf('@');
    if (atIndex <= 0 || atIndex == normalized.length - 1) {
      return null;
    }
    final domain = normalized.substring(atIndex + 1);
    final preset = _presets[domain];
    if (preset != null) {
      return preset;
    }
    return AutoDiscoverySettings(
      imapHost: 'imap.$domain',
      imapPort: 993,
      imapSsl: true,
      smtpHost: 'smtp.$domain',
      smtpPort: 465,
      smtpSsl: true,
      source: 'Domain guess',
      isExactMatch: false,
    );
  }
}
