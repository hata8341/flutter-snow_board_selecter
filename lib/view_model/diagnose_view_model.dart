import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/answer.dart';
import 'package:sbselector/view_model/answer_view_model.dart';
import 'package:sbselector/view_model/indicator_view_model.dart';
import 'package:sbselector/widgets/end_dialog.dart';

void checkEndDialog(WidgetRef ref, BuildContext context) {
  return ref.listen(indicatorStateNotifierProvider, (previous, next) {
    if (next == 1.0) {
      showSelfDialog(endDialog(context, ref));
    }
  });
}

void respond(WidgetRef ref, String category, double value) {
  final indicatorStateController =
      ref.read(indicatorStateNotifierProvider.notifier);
  indicatorStateController.incrementIndicatorValue();
  final answer = Answer(category: category, answerValue: value);
  final answerListController = ref.read(answerListProvider.notifier);
  answerListController.addAnswer(answer);
}

void mistake(WidgetRef ref) {
  ref.watch(indicatorStateNotifierProvider.notifier).decrementIndicatorValue();
  final answerController = ref.read(answerListProvider.notifier);
  answerController.removeAnswer();
}
