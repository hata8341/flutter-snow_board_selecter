import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/bottom_bar_index.dart';
import 'package:sbselector/const/ridetype.dart';
import 'package:sbselector/model/page_state.dart';

class PageStateNotifier extends StateNotifier<PageState> {
  PageStateNotifier(this._read) : super(const PageState());

  final Reader _read;

  void changeIndex(int index) {
    state = state.copyWith(bottomBarIndex: BottomBarIndex.values[index]);
  }

  void toggleTheme() {
    state = state.copyWith(themeState: !state.themeState);
  }

  void toggleBgm() {
    state = state.copyWith(bgmState: !state.bgmState);
  }

  String checkWriteInRideType(RideType rideType) {
    final rideTypeName = rideType.nameJp;
    if (rideTypeName == 'フリーラン・パウダー') {
      final words = rideTypeName.split('・');
      final strBuffer = StringBuffer(words[0])
        ..writeln()
        ..write(words[1]);
      return strBuffer.toString();
    }

    return rideTypeName;
  }

  bool isDiagnoseTop() {
    return state.bottomBarIndex.value == 1 ? true : false;
  }
}

final pageStateProvider =
    StateNotifierProvider.autoDispose<PageStateNotifier, PageState>((ref) {
  return PageStateNotifier((ref.read));
});
