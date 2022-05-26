import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/answer.dart';
import 'package:sbselector/model/diagnose_state.dart';
import 'package:sbselector/view_model/answer_view_model.dart';
import 'package:sbselector/view_model/question_view_model.dart';
import 'package:sbselector/widgets/end_dialog.dart';

class DiagnoseStateNotifier extends StateNotifier<DiagnoseState> {
  DiagnoseStateNotifier(this._read)
      : super(const DiagnoseState(indicatorValue: 0.0));

  final Reader _read;

  void incrementIndicatorValue() {
    var newValue = (state.indicatorValue + 0.1) * 10;
    newValue = newValue.roundToDouble() / 10;
    state = state.copyWith(indicatorValue: newValue);
  }

  void decrementIndicatorValue() {
    var newValue = (state.indicatorValue - 0.1) * 10;
    newValue = newValue.roundToDouble() / 10;
    state = state.copyWith(indicatorValue: newValue);
  }

  void resetState() {
    state = state.copyWith(
      indicatorValue: 0.0,
    );
  }
}

// statenotifierProvider作成
final diagnoseStateNotifierProvider =
    StateNotifierProvider<DiagnoseStateNotifier, DiagnoseState>((ref) {
  return DiagnoseStateNotifier(ref.read);
});

final questionIndexProvider = Provider<int>((ref) {
  final questionSize = ref.watch(questionListLengthProvider);
  final maxIndex = (questionSize - 1).toDouble();
  final indicatorValue =
      ref.watch(diagnoseStateNotifierProvider).indicatorValue;
  if (indicatorValue >= (maxIndex / 10)) return maxIndex.toInt();

  return (indicatorValue * 10).toInt();
});

final questionNumProvider = Provider<String>((ref) {
  final questionIndex = ref.watch(questionIndexProvider);
  return (questionIndex + 1).toString();
});

final indicatorValueProvider = Provider<double>((ref) {
  final indicatorValue =
      ref.watch(diagnoseStateNotifierProvider).indicatorValue;
  return indicatorValue;
});

void checkEndDialog(WidgetRef ref, BuildContext context) {
  return ref.listen(indicatorValueProvider, (previous, next) {
    if (next == 1.0) {
      showSelfDialog(endDialog(context, ref));
    }
  });
}

// indicatorが0以上の場合true,0ならtrue;

final misIconStateProvider = Provider<bool>((ref) {
  final indicatorValue =
      ref.watch(diagnoseStateNotifierProvider).indicatorValue;
  return indicatorValue > 0.0;
});

void respond(WidgetRef ref, String category, double value) {
  final diagnoseStateController =
      ref.read(diagnoseStateNotifierProvider.notifier);
  diagnoseStateController.incrementIndicatorValue();
  final answer = Answer(category: category, answerValue: value);
  final answerListController = ref.read(answerListProvider.notifier);
  answerListController.addAnswer(answer);
}

void mistake(WidgetRef ref) {
  ref.watch(diagnoseStateNotifierProvider.notifier).decrementIndicatorValue();
  final answerController = ref.read(answerListProvider.notifier);
  answerController.removeAnswer();
}

void computeResult(WidgetRef ref, List<Answer> list) {
  debugPrint('結果算出処理');
  final gTList =
      list.where((answer) => answer.category == 'groundtrickJib').toList();
  final fPList =
      list.where((answer) => answer.category == 'freerunPowder').toList();
  final gTTotal = computeTotal(gTList);
  final fPTotal = computeTotal(fPList);
  print({gTTotal});
  print({fPTotal});
  final rideType = checkRideType(gTTotal, fPTotal);
  print(rideType);
}

double computeTotal(List<Answer> list) {
  double count = 0.0;
  for (var answer in list) {
    count = count + answer.answerValue;
  }
  return count;
}

String checkRideType(double gtTotal, double fpTotal) {
  final difference = gtTotal - fpTotal;
  if (difference > 9) {
    return 'grandTrickJib';
  } else if (difference < -9) {
    return 'freerunPowder';
  } else {
    return 'allRround';
  }
}
