import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/answer.dart';

class AnswerListNotifier extends StateNotifier<List<Answer>> {
  AnswerListNotifier(this._read) : super([]);

  final Reader _read;

  void addAnswer(Answer answer) {
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

  List<Answer> createJGList() {
    return state
        .where((answer) => answer.category == 'groundtrickJib')
        .toList();
  }

  List<Answer> createFPList() {
    return state.where((answer) => answer.category == 'freerunPowder').toList();
  }

  void resetState() {
    state = [];
  }
}

final answerListProvider =
    StateNotifierProvider<AnswerListNotifier, List<Answer>>(
  (ref) {
    return AnswerListNotifier(ref.read);
  },
);
