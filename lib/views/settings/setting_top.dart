import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sbselector/view_model/page_view_model.dart';
import 'package:sbselector/view_model/setting_view_model.dart';
import 'package:sbselector/view_model/theme_view_mode.dart';

class SettingList extends ConsumerWidget {
  const SettingList({Key? key}) : super(key: key);
  static const darkModeButtonKey = Key('darkMode');

  static const bgmButtonKey = Key('bgm');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageStateProvider);
    final pageController = ref.watch(pageStateProvider.notifier);
    final themeSwitchStatus = ref.watch(themeStateProvider).switchStatus;
    final themeController = ref.watch(themeStateProvider.notifier);
    final settingController = ref.watch(settingProvider.notifier);
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        SwitchListTile(
          key: darkModeButtonKey,
          value: themeSwitchStatus,
          onChanged: (bool status) {
            themeController.update(status);
          },
          secondary: const Icon(Icons.dark_mode),
          title: const Text('ダークモード'),
        ),
        SwitchListTile(
          key: bgmButtonKey,
          value: pageState.bgmState,
          onChanged: (bool newState) {
            pageController.toggleBgm();
          },
          secondary: const Icon(Icons.music_note),
          title: const Text('ミュージック'),
        ),
        const Divider(
          height: 10.0,
          indent: 20.0,
          endIndent: 20.0,
        ),
        ListTile(
          title: const Text('お問い合わせ'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            try {
              settingController.contactForm();
            } catch (_) {
              Navigator.pushNamed(context, '/errorPage');
            }
          },
          leading: const Icon(Icons.contact_mail),
        ),
        ListTile(
          title: const Text('アプリを評価する'),
          leading: const Icon(Icons.rate_review),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () async {
            final InAppReview inAppReview = InAppReview.instance;
            if (await inAppReview.isAvailable()) {
              inAppReview.requestReview();
            }
          },
        ),
        const Divider(
          height: 10.0,
          indent: 20.0,
          endIndent: 20.0,
        ),
        ListTile(
          title: const Text('このアプリについて'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            settingController.appGuidePage();
          },
          leading: const Icon(Icons.snowboarding),
        ),
        ListTile(
          title: const Text('利用規約・プライバシーポリシー'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            settingController.contactPrivacyPage();
          },
          leading: const Icon(Icons.privacy_tip),
        ),
        ListTile(
          title: const Text('ライセンス情報'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () async {
            final info = await PackageInfo.fromPlatform();
            final date = DateTime.now().year.toString();
            showLicensePage(
              context: context,
              applicationIcon: Image.asset(
                'images/snow_penguin_top.png',
                fit: BoxFit.fitHeight,
              ),
              applicationName: info.appName,
              applicationVersion: info.version,
              applicationLegalese: '$date Thata',
            );
          },
          leading: const Icon(Icons.perm_device_info),
        ),
      ],
    );
  }
}
