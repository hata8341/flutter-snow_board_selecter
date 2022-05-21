import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = StateProvider<bool>((ref) {
  return false;
});
final bgmProvider = StateProvider<bool>((ref) {
  return false;
});

class SettingList extends HookConsumerWidget {
  SettingList({Key? key}) : super(key: key);
  bool value = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.watch(themeProvider.state);
    final bgmController = ref.watch(bgmProvider.state);
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        SwitchListTile(
          value: themeController.state,
          onChanged: (bool newValue) {
            themeController.state = newValue;
          },
          title: const Text('ダークモード'),
        ),
        SwitchListTile(
          value: bgmController.state,
          onChanged: (bool newValue) {
            bgmController.state = newValue;
          },
          title: const Text('ミュージック'),
        ),
        const Divider(
          height: 10.0,
          indent: 20.0,
          endIndent: 20.0,
          color: Colors.black,
        ),
        ListTile(
          title: const Text('フィードバックする'),
          trailing: IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              print('フィードバックする');
            },
          ),
        ),
        ListTile(
          title: const Text('メッセージを残す'),
          trailing: IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              print('メッセージを残す');
            },
          ),
        ),
        ListTile(
          title: const Text('アプリを評価する'),
          trailing: IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              print('アプリを評価する');
            },
          ),
        ),
        const Divider(
          height: 10.0,
          indent: 20.0,
          endIndent: 20.0,
          color: Colors.black,
        ),
        ListTile(
          title: const Text('インフォメーション'),
          trailing: IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              print('インフォメーション');
            },
          ),
        ),
        ListTile(
          title: const Text('プライバシーポリシー'),
          trailing: IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              print('プライバシーポリシー');
            },
          ),
        ),
      ],
    );
  }
}
