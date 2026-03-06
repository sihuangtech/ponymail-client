import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class EmailDetailScreen extends StatelessWidget {
  const EmailDetailScreen({super.key, required this.emailId});

  final String emailId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('邮件 #$emailId')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: HtmlWidget('<h2>示例邮件</h2><p>这里渲染 HTML 正文。</p>'),
      ),
    );
  }
}
