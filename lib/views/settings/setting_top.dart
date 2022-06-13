import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/page_view_model.dart';
import 'package:sbselector/view_model/theme_view_mode.dart';

class SettingList extends HookConsumerWidget {
  const SettingList({Key? key}) : super(key: key);
  final bool value = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageStateProvider);
    final pageController = ref.watch(pageStateProvider.notifier);
    final themeSwitchStatus = ref.watch(themeStateProvider).switchStatus;
    final themeController = ref.watch(themeStateProvider.notifier);
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        SwitchListTile(
          value: themeSwitchStatus,
          onChanged: (bool status) {
            themeController.update(status);
          },
          title: const Text('ダークモード'),
        ),
        SwitchListTile(
          value: pageState.bgmState,
          onChanged: (bool newState) {
            pageController.toggleBgm();
          },
          title: const Text('ミュージック'),
        ),
        const Divider(
          height: 10.0,
          indent: 20.0,
          endIndent: 20.0,
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
