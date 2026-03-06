import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../../data/models/compose_request.dart';
import '../../providers/account_provider.dart';
import '../../providers/compose_provider.dart';

class ComposeScreen extends ConsumerStatefulWidget {
  const ComposeScreen({super.key});

  @override
  ConsumerState<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends ConsumerState<ComposeScreen> {
  final _toController = TextEditingController();
  final _ccController = TextEditingController();
  final _bccController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();
  final List<String> _attachments = [];
  bool _draftSaved = false;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) {
      return;
    }
    setState(() {
      _attachments.addAll(
        result.files
            .where((file) => file.path != null)
            .map((file) => file.path!)
            .toList(),
      );
      _draftSaved = true;
    });
  }

  Future<void> _pickSchedule() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      initialDate: now,
    );
    if (date == null || !mounted) {
      return;
    }
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );
    if (time == null) {
      return;
    }
    ref.read(scheduledAtProvider.notifier).state = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  void _wrapSelection(String start, String end) {
    final selection = _bodyController.selection;
    final text = _bodyController.text;
    if (!selection.isValid) {
      _bodyController.text = '$text$start$end';
      return;
    }
    final selected = selection.textInside(text);
    final replaced = selection.textBefore(text) +
        start +
        selected +
        end +
        selection.textAfter(text);
    _bodyController.value = TextEditingValue(
      text: replaced,
      selection: TextSelection.collapsed(
        offset: selection.start + start.length + selected.length + end.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _bodyController.addListener(() {
      if (!_draftSaved && _bodyController.text.isNotEmpty) {
        setState(() => _draftSaved = true);
      }
    });
  }

  @override
  void dispose() {
    _toController.dispose();
    _ccController.dispose();
    _bccController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final composeState = ref.watch(composeProvider);
    final currentAccount = ref.watch(currentAccountProvider);
    final scheduledAt = ref.watch(scheduledAtProvider);
    final notifier = ref.read(composeProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.writeEmail)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _toController,
            decoration: InputDecoration(labelText: context.l10n.to),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _ccController,
            decoration: InputDecoration(labelText: context.l10n.cc),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _bccController,
            decoration: InputDecoration(labelText: context.l10n.bcc),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _subjectController,
            decoration: InputDecoration(labelText: context.l10n.subject),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              IconButton(
                onPressed: () => _wrapSelection('<b>', '</b>'),
                icon: const Icon(Icons.format_bold),
              ),
              IconButton(
                onPressed: () => _wrapSelection('<i>', '</i>'),
                icon: const Icon(Icons.format_italic),
              ),
              IconButton(
                onPressed: () => _wrapSelection('<ul><li>', '</li></ul>'),
                icon: const Icon(Icons.format_list_bulleted),
              ),
              IconButton(
                onPressed: () => _wrapSelection('<a href="">', '</a>'),
                icon: const Icon(Icons.link),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _bodyController,
            minLines: 12,
            maxLines: 18,
            decoration: InputDecoration(labelText: context.l10n.body),
          ),
          const SizedBox(height: 16),
          if (_attachments.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _attachments
                  .map((attachment) => Chip(label: Text(attachment.split('/').last)))
                  .toList(),
            ),
          if (_draftSaved) ...[
            const SizedBox(height: 12),
            Text(
              context.l10n.draftSaved,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          if (scheduledAt != null) ...[
            const SizedBox(height: 12),
            Text('${context.l10n.scheduleSend}: $scheduledAt'),
          ],
          const SizedBox(height: 16),
          Row(
            children: [
              TextButton.icon(
                onPressed: _pickFile,
                icon: const Icon(Icons.attach_file),
                label: Text(context.l10n.addAttachment),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: _pickSchedule,
                icon: const Icon(Icons.schedule_send_outlined),
                label: Text(context.l10n.scheduleSend),
              ),
              const Spacer(),
              FilledButton(
                onPressed: composeState.isLoading || currentAccount == null
                    ? null
                    : () async {
                        await notifier.send(
                          ComposeRequest(
                            accountId: currentAccount.id,
                            to: notifier.parseAddresses(_toController.text),
                            cc: notifier.parseAddresses(_ccController.text),
                            bcc: notifier.parseAddresses(_bccController.text),
                            subject: _subjectController.text.trim(),
                            bodyPlain: _bodyController.text,
                            bodyHtml: _bodyController.text,
                            attachmentPaths: _attachments,
                            scheduledAt: scheduledAt,
                          ),
                        );
                        if (mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                child: composeState.isLoading
                    ? const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(context.l10n.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
