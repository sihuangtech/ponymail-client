class EmailModel {
  EmailModel({
    required this.id,
    required this.subject,
    required this.fromName,
    required this.fromEmail,
    required this.preview,
    required this.date,
    this.isRead = false,
    this.isStarred = false,
  });

  final int id;
  final String subject;
  final String fromName;
  final String fromEmail;
  final String preview;
  final DateTime date;
  final bool isRead;
  final bool isStarred;
}
