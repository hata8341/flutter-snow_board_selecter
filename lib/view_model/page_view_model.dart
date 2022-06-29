import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sbselector/const/bottom_bar_index.dart';
import 'package:sbselector/const/ride_type.dart';
import 'package:sbselector/model/page_state.dart';

class PageStateNotifier extends StateNotifier<PageState> {
  PageStateNotifier() : super(const PageState());

  void changeIndex(int index) {
    state = state.copyWith(bottomBarIndex: BottomBarIndex.values[index]);
  }

  void _onBgm() async {
    state = state.copyWith(player: AudioPlayer());
    await state.player?.setAsset('bgm/tie_no_wa.mp3');
    await state.player?.setLoopMode(LoopMode.one);
    await state.player?.load();
    await state.player?.play();
  }

  void _offBgm() async {
    await state.player?.stop();
    await state.player?.dispose();
  }

  void toggleBgm() async {
    state = state.copyWith(bgmState: !state.bgmState);
    state.bgmState ? _onBgm() : _offBgm();
  }

  void checkResumedBgm() async {
    if (state.player != null && state.bgmState == true) {
      await state.player?.play();
    }
  }

  void checkPausedBgm() async {
    if (state.bgmState == true) {
      await state.player?.stop();
    }
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
  return PageStateNotifier();
});
