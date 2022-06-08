import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sbselector/const/bottom_bar_index.dart';

part 'page_state.freezed.dart';

@freezed
class PageState with _$PageState {
  const factory PageState({
    @Default(BottomBarIndex.one) BottomBarIndex bottomBarIndex,
    @Default(false) bool themeState,
    @Default(false) bool bgmState,
  }) = _PageState;
}
