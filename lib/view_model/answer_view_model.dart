import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/answer.dart';

class AnswerListNotifier extends StateNotifier<List<Answer>> {
  AnswerListNotifier(this._read) : super([]);

  final Reader _read;

  void addAnswer(Answer answer) {
    print('解答の数');
    print(state.length);
    state = [...state, answer];
  }

  void removeAnswer() {
    int count = 0;
    List<Answer> newList = [];
    while (count < state.length - 1) {
      newList.add(state[count]);
      count++;
    }
    state = newList;
  }

  List<Answer> _createJGList() {
    return state
        .where((answer) => answer.category == 'groundtrickJib')
        .toList();
  }

  List<Answer> _createFPList() {
    return state.where((answer) => answer.category == 'freerunPowder').toList();
  }

  double _computedTotal(List<Answer> list) {
    double count = 0.0;
    for (final answer in list) {
      count += answer.answerValue;
    }
    return count;
  }

  String _checkRideType(double jGTotal, double fPTotal) {
    final difference = jGTotal - fPTotal;
    if (difference > 9) {
      return 'grandTrickJib';
    } else if (difference < -9) {
      return 'freerunPowder';
    } else {
      return 'allRround';
    }
  }

  String computedResult() {
    final jGList = _createJGList();
    final fPList = _createFPList();

    final jGTotal = _computedTotal(jGList);
    final fPTotal = _computedTotal(fPList);
    resetState();
    return _checkRideType(jGTotal, fPTotal);
  }

  // reset,refresh
  void resetState() {
    print('答えの数');
    print(state.length);
    state = [];
    print(state.length);
  }
}

final answerListProvider =
    StateNotifierProvider<AnswerListNotifier, List<Answer>>(
  (ref) {
    return AnswerListNotifier(ref.read);
  },
);
