import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});

  @override
  State<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  final _toController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();
  final List<String> _attachments = [];

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    setState(() {
      _attachments.addAll(result.files.where((e) => e.path != null).map((e) => e.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('写邮件')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _toController, decoration: const InputDecoration(labelText: '收件人')),
            TextField(controller: _subjectController, decoration: const InputDecoration(labelText: '主题')),
            Expanded(child: TextField(controller: _bodyController, maxLines: null, expands: true, decoration: const InputDecoration(labelText: '正文'))),
            Wrap(spacing: 8, children: _attachments.map((a) => Chip(label: Text(a))).toList()),
            Row(children: [TextButton.icon(onPressed: _pickFile, icon: const Icon(Icons.attach_file), label: const Text('添加附件')), const Spacer(), FilledButton(onPressed: () {}, child: const Text('发送'))]),
          ],
        ),
      ),
    );
  }
}
