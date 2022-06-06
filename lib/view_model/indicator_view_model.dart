import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndicatorStateNotifier extends StateNotifier<double> {
  IndicatorStateNotifier(this._read) : super(0.0);

  final Reader _read;

  void incrementIndicatorValue() {
    var newValue = (state + 0.1) * 10;
    newValue = newValue.roundToDouble() / 10;
    state = newValue;
  }

  void decrementIndicatorValue() {
    var newValue = (state - 0.1) * 10;
    newValue = newValue.roundToDouble() / 10;
    state = newValue;
  }

  bool getMissIconState() {
    return state > 0.0;
  }
}

final indicatorStateNotifierProvider =
    StateNotifierProvider.autoDispose<IndicatorStateNotifier, double>((ref) {
  return IndicatorStateNotifier(ref.read);
});
