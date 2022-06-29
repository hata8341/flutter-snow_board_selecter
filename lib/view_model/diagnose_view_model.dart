import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/ride_type.dart';
import 'package:sbselector/model/answer.dart';
import 'package:sbselector/view_model/answer_view_model.dart';
import 'package:sbselector/view_model/history_view_model.dart';
import 'package:sbselector/view_model/indicator_view_model.dart';

class DiagnoseNotifier extends StateNotifier<void> {
  DiagnoseNotifier(this._read) : super(null);

  final Reader _read;

  late final IndicatorStateNotifier indicatorController =
      _read(indicatorStateNotifierProvider.notifier);
  late final AnswerListNotifier answerListController =
      _read(answerListProvider.notifier);
  late final HistoryNotifier _historyController =
      _read(historyNotifierProvider.notifier);
  void respond(String category, int value) {
    indicatorController.incrementIndicatorValue();
    final answer = Answer(category: category, answerValue: value);
    answerListController.addAnswer(answer);
  }

  void missTake() {
    indicatorController.decrementIndicatorValue();
    answerListController.removeAnswer();
  }

  double _computedTotal(List<Answer> list) {
    double count = 0.0;
    for (final answer in list) {
      count += answer.answerValue;
    }
    return count;
  }

  RideType _checkRideType(double jGTotal, double fPTotal) {
    final difference = jGTotal - fPTotal;
    final RideType rideType;
    if (difference > 9) {
      rideType = RideType.grandTrickJib;
    } else if (difference < -9) {
      rideType = RideType.freerunPowder;
    } else {
      rideType = RideType.allRound;
    }
    _historyController.add(rideType);
    return rideType;
  }

  RideType computedResult() {
    final jGList = answerListController.createJGList();
    final fPList = answerListController.createFPList();

    final jGTotal = _computedTotal(jGList);
    final fPTotal = _computedTotal(fPList);
    answerListController.resetState();

    return _checkRideType(jGTotal, fPTotal);
  }
}

final diagnoseProvider =
    StateNotifierProvider.autoDispose<DiagnoseNotifier, void>((ref) {
  return DiagnoseNotifier(ref.watch);
});
