import 'package:hooks_riverpod/hooks_riverpod.dart';

// historynotifierを作成
class PageNotifier extends StateNotifier<void> {
  PageNotifier(this._read) : super(null);

  final Reader _read;

  String egToJp(String rideType) {
    final String answer;
    switch (rideType) {
      case 'grandTrickJib':
        answer = 'ジブ・グラトリ';
        break;
      case 'freerunPowder':
        answer = 'フリーランパウダー';
        break;
      case 'allRound':
        answer = 'オールラウンド';
        break;
      default:
        answer = '';
    }
    return answer;
  }
}

final pageProvider = StateNotifierProvider<PageNotifier, void>((ref) {
  return PageNotifier((ref.read));
});
