import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryTopPage extends HookConsumerWidget {
  HistoryTopPage({Key? key}) : super(key: key);
  final items = List.generate(5, (index) => 'スタイル$index');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/historyDetail',
              arguments: index.toString(),
            );
          },
          child: Column(
            children: [
              ListTile(
                leading: const Text('テスト'),
                title: Text(item),
                subtitle: Text('日付:$index'),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
