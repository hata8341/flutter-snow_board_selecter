import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/setting.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingNotifier extends StateNotifier<void> {
  SettingNotifier() : super(null);
  final Uri _formUri = Uri.parse(formUrl);

  final Uri _privacyUri = Uri.parse(privacyUrl);

  final Uri _appGuideUri = Uri.parse(appGuideUrl);

  void contactForm() async {
    if (!await launchUrl(_formUri)) throw '接続されていません';
  }

  void contactPrivacyPage() async {
    if (!await launchUrl(_privacyUri)) throw '接続されていません';
  }

  void appGuidePage() async {
    if (!await launchUrl(_appGuideUri)) throw '接続されていません';
  }
}

final settingProvider =
    StateNotifierProvider.autoDispose<SettingNotifier, void>((ref) {
  return SettingNotifier();
});
