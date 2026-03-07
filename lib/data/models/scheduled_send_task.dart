import 'compose_request.dart';

class ScheduledSendTask {
  const ScheduledSendTask({
    required this.id,
    required this.request,
    required this.createdAt,
    this.lastError,
  });

  final String id;
  final ComposeRequest request;
  final DateTime createdAt;
  final String? lastError;

  ScheduledSendTask copyWith({
    String? id,
    ComposeRequest? request,
    DateTime? createdAt,
    String? lastError,
    bool clearLastError = false,
  }) {
    return ScheduledSendTask(
      id: id ?? this.id,
      request: request ?? this.request,
      createdAt: createdAt ?? this.createdAt,
      lastError: clearLastError ? null : (lastError ?? this.lastError),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'request': request.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'lastError': lastError,
    };
  }

  factory ScheduledSendTask.fromJson(Map<String, dynamic> json) {
    return ScheduledSendTask(
      id: json['id'] as String,
      request: ComposeRequest.fromJson(
        Map<String, dynamic>.from(json['request'] as Map),
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastError: json['lastError'] as String?,
    );
  }
}
