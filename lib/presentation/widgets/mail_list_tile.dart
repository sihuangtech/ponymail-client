import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/email_model.dart';

class MailListTile extends StatelessWidget {
  const MailListTile({
    super.key,
    required this.email,
    required this.onTap,
    this.onLongPress,
    this.isSelected = false,
    this.showSelection = false,
  });

  final EmailModel email;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final bool isSelected;
  final bool showSelection;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final sender = email.fromName.isEmpty ? email.fromEmail : email.fromName;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        contentPadding: const EdgeInsets.all(16),
        leading: showSelection
            ? Checkbox(value: isSelected, onChanged: (_) => onTap())
            : CircleAvatar(
                backgroundColor: email.isRead
                    ? scheme.secondaryContainer
                    : scheme.primary.withValues(alpha: 0.16),
                child: Text(sender.characters.first.toUpperCase()),
              ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                sender,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: email.isRead ? FontWeight.w500 : FontWeight.w700,
                ),
              ),
            ),
            if (!email.isRead)
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      email.subject,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: email.isRead
                            ? FontWeight.w500
                            : FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(DateFormat('MM-dd HH:mm').format(email.date)),
                ],
              ),
              const SizedBox(height: 6),
              Text(email.preview, maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
        trailing: email.isStarred
            ? const Icon(Icons.star_rounded, color: Color(0xFFFFC300))
            : null,
      ),
    );
  }
}
