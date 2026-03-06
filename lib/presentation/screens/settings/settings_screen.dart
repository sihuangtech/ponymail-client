import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        children: const [
          ListTile(title: Text('主题'), subtitle: Text('跟随系统')),
          ListTile(title: Text('通知'), subtitle: Text('已开启')),
          ListTile(title: Text('签名'), subtitle: Text('Sent from PonyMail')),
        ],
      ),
    );
  }
}
