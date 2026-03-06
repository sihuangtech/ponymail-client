import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/build_context_x.dart';

class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});

  @override
  State<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
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
        result.files.where((file) => file.path != null).map((file) => file.name),
      );
      _draftSaved = true;
    });
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
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'bold', icon: Icon(Icons.format_bold)),
              ButtonSegment(value: 'italic', icon: Icon(Icons.format_italic)),
              ButtonSegment(value: 'list', icon: Icon(Icons.format_list_bulleted)),
              ButtonSegment(value: 'link', icon: Icon(Icons.link)),
            ],
            selected: const <String>{},
            onSelectionChanged: (_) {},
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
                  .map((attachment) => Chip(label: Text(attachment)))
                  .toList(),
            ),
          if (_draftSaved) ...[
            const SizedBox(height: 12),
            Text(
              context.l10n.draftSaved,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
                onPressed: () {},
                icon: const Icon(Icons.schedule_send_outlined),
                label: Text(context.l10n.scheduleSend),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(context.l10n.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
