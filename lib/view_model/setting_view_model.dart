import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sbselector/const/setting.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _uri = Uri.parse(formUrl);

class SettingNotifier extends StateNotifier<void> {
  SettingNotifier() : super(null);
  void contactForm() async {
    if (!await launchUrl(_uri)) throw '接続されていません';
  }
}

final settingProvider = StateNotifierProvider<SettingNotifier, void>((ref) {
  return SettingNotifier();
});
