import 'package:flutter/material.dart';

import '../../../core/extensions/build_context_x.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.search)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBar(
              hintText: context.l10n.searchHint,
              leading: const Icon(Icons.search_rounded),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.history_rounded),
                    title: Text('updates@ponymail.app'),
                  ),
                  ListTile(
                    leading: Icon(Icons.history_rounded),
                    title: Text('Design review notes'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
