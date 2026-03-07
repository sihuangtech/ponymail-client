import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../../data/models/account_model.dart';
import '../../../data/services/account_auto_discovery_service.dart';
import '../../providers/account_provider.dart';
import '../../providers/app_providers.dart';

class AccountFormScreen extends ConsumerStatefulWidget {
  const AccountFormScreen({super.key, this.accountId});

  final int? accountId;

  bool get isEditing => accountId != null;

  @override
  ConsumerState<AccountFormScreen> createState() => _AccountFormScreenState();
}

class _AccountFormScreenState extends ConsumerState<AccountFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _signatureController = TextEditingController();
  final _imapHostController = TextEditingController();
  final _imapPortController = TextEditingController(text: '993');
  final _smtpHostController = TextEditingController();
  final _smtpPortController = TextEditingController(text: '465');

  bool _imapSsl = true;
  bool _smtpSsl = true;
  bool _isSaving = false;
  bool _isLoading = false;
  String? _discoveryMessage;

  AccountModel? get _editingAccount {
    final accounts = ref.read(accountProvider).value ?? const <AccountModel>[];
    final accountId = widget.accountId;
    if (accountId == null) {
      return null;
    }
    for (final account in accounts) {
      if (account.id == accountId) {
        return account;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    final account = _editingAccount;
    if (account != null) {
      _displayNameController.text = account.displayName;
      _emailController.text = account.email;
      _signatureController.text = account.signature;
      _imapHostController.text = account.imapHost;
      _imapPortController.text = account.imapPort.toString();
      _smtpHostController.text = account.smtpHost;
      _smtpPortController.text = account.smtpPort.toString();
      _imapSsl = account.imapSsl;
      _smtpSsl = account.smtpSsl;
      _loadPassword(account);
    }
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _signatureController.dispose();
    _imapHostController.dispose();
    _imapPortController.dispose();
    _smtpHostController.dispose();
    _smtpPortController.dispose();
    super.dispose();
  }

  Future<void> _loadPassword(AccountModel account) async {
    setState(() => _isLoading = true);
    final password = await ref
        .read(accountProvider.notifier)
        .getPassword(account);
    if (!mounted) {
      return;
    }
    if (password != null) {
      _passwordController.text = password;
    }
    setState(() => _isLoading = false);
  }

  void _applyDiscoveredSettings(AutoDiscoverySettings settings) {
    _imapHostController.text = settings.imapHost;
    _imapPortController.text = settings.imapPort.toString();
    _smtpHostController.text = settings.smtpHost;
    _smtpPortController.text = settings.smtpPort.toString();
    _imapSsl = settings.imapSsl;
    _smtpSsl = settings.smtpSsl;
    _discoveryMessage = settings.isExactMatch
        ? '${context.l10n.accountDiscoveryApplied}: ${settings.source}'
        : '${context.l10n.accountDiscoveryGuessApplied}: ${settings.source}';
  }

  void _runAutoDiscovery() {
    final service = ref.read(accountAutoDiscoveryServiceProvider);
    final settings = service.discover(_emailController.text);
    if (settings == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.accountDiscoveryInvalidEmail)),
      );
      return;
    }
    setState(() => _applyDiscoveredSettings(settings));
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final editing = _editingAccount;
    final email = _emailController.text.trim();
    final model = AccountModel(
      id: editing?.id ?? 0,
      email: email,
      displayName: _displayNameController.text.trim(),
      imapHost: _imapHostController.text.trim(),
      imapPort: int.parse(_imapPortController.text.trim()),
      imapSsl: _imapSsl,
      smtpHost: _smtpHostController.text.trim(),
      smtpPort: int.parse(_smtpPortController.text.trim()),
      smtpSsl: _smtpSsl,
      passwordKey: editing?.passwordKey ?? 'account:$email',
      color: editing?.color ?? _colorFromEmail(email),
      signature: _signatureController.text.trim(),
      createdAt: editing?.createdAt ?? DateTime.now(),
    );

    setState(() => _isSaving = true);
    final notifier = ref.read(accountProvider.notifier);
    final error = widget.isEditing
        ? await notifier.updateAccount(model, _passwordController.text)
        : await notifier.addAccount(model, _passwordController.text);
    if (!mounted) {
      return;
    }
    setState(() => _isSaving = false);
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isBusy = _isSaving || _isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEditing ? context.l10n.editAccount : context.l10n.addAccount,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _displayNameController,
              decoration: InputDecoration(labelText: context.l10n.accountName),
              textInputAction: TextInputAction.next,
              validator: _validateRequired,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: context.l10n.emailAddress),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: _validateEmail,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: context.l10n.password),
              obscureText: true,
              textInputAction: TextInputAction.next,
              validator: _validateRequired,
            ),
            const SizedBox(height: 12),
            FilledButton.tonalIcon(
              onPressed: isBusy ? null : _runAutoDiscovery,
              icon: const Icon(Icons.auto_fix_high_outlined),
              label: Text(context.l10n.autoDiscoverSettings),
            ),
            if (_discoveryMessage != null) ...[
              const SizedBox(height: 8),
              Text(
                _discoveryMessage!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 20),
            Text(
              context.l10n.serverSettings,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _imapHostController,
              decoration: const InputDecoration(labelText: 'IMAP Host'),
              textInputAction: TextInputAction.next,
              validator: _validateRequired,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _imapPortController,
              decoration: const InputDecoration(labelText: 'IMAP Port'),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: _validatePort,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(context.l10n.useSslForImap),
              value: _imapSsl,
              onChanged: isBusy
                  ? null
                  : (value) => setState(() => _imapSsl = value),
            ),
            TextFormField(
              controller: _smtpHostController,
              decoration: const InputDecoration(labelText: 'SMTP Host'),
              textInputAction: TextInputAction.next,
              validator: _validateRequired,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _smtpPortController,
              decoration: const InputDecoration(labelText: 'SMTP Port'),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: _validatePort,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(context.l10n.useSslForSmtp),
              value: _smtpSsl,
              onChanged: isBusy
                  ? null
                  : (value) => setState(() => _smtpSsl = value),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _signatureController,
              decoration: InputDecoration(labelText: context.l10n.signature),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: isBusy ? null : _save,
              child: Text(
                _isSaving ? context.l10n.saving : context.l10n.saveAccount,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.requiredField;
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.requiredField;
    }
    final normalized = value.trim();
    if (!normalized.contains('@') ||
        normalized.startsWith('@') ||
        normalized.endsWith('@')) {
      return context.l10n.accountDiscoveryInvalidEmail;
    }
    return null;
  }

  String? _validatePort(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.requiredField;
    }
    final port = int.tryParse(value.trim());
    if (port == null || port <= 0 || port > 65535) {
      return context.l10n.invalidPort;
    }
    return null;
  }

  int _colorFromEmail(String email) {
    const palette = <int>[
      0xFF5B8CFF,
      0xFF00A37A,
      0xFFF97316,
      0xFFDC2626,
      0xFF7C3AED,
      0xFF0F766E,
    ];
    return palette[email.hashCode.abs() % palette.length];
  }
}
