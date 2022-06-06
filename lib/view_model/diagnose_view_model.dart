import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/rideType.dart';
import 'package:sbselector/model/answer.dart';
import 'package:sbselector/view_model/answer_view_model.dart';
import 'package:sbselector/view_model/indicator_view_model.dart';
import 'package:sbselector/widgets/end_dialog.dart';

class DiagnoseNotifier extends StateNotifier<void> {
  DiagnoseNotifier(this._read) : super(null);

  final Reader _read;

  late final IndicatorStateNotifier indicatorController =
      _read(indicatorStateNotifierProvider.notifier);
  late final AnswerListNotifier answerListController =
      _read(answerListProvider.notifier);

  void checkEndDialog(WidgetRef ref, BuildContext context) {
    return ref.listen(indicatorStateNotifierProvider, (previous, next) {
      if (next == 1.0) {
        showSelfDialog(endDialog(context, ref));
      }
    });
  }

  void respond(String category, double value) {
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
    if (difference > 9) {
      return RideType.grandTrickJib;
    } else if (difference < -9) {
      return RideType.freerunPowder;
    } else {
      return RideType.allRound;
    }
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
  return DiagnoseNotifier(ref.read);
});
