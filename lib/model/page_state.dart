import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sbselector/const/bottom_bar_index.dart';

part 'page_state.freezed.dart';

@freezed
class PageState with _$PageState {
  const factory PageState({
    @Default(BottomBarIndex.one) BottomBarIndex bottomBarIndex,
    @Default(null) AudioPlayer? player,
    @Default(false) bool bgmState,
  }) = _PageState;
}
