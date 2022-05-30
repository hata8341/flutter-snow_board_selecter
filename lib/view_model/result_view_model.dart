import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/answer.dart';

// 初期値は[]
// addメソッド
// removeメソッド
class AnswerListNotifier extends StateNotifier<List<Answer>> {
  AnswerListNotifier(this._read) : super([]);

  final Reader _read;

  void addAnswer(Answer answer) {
    state = [...state, answer];
  }

  // 新しく配列を作成してみる、idを状態としてもたせていないため
  void removeAnswer() {
    int count = 0;
    List<Answer> newList = [];
    while (count < state.length - 1) {
      newList.add(state[count]);
      count++;
    }
    state = newList;
  }
}

final answerListProvider =
    StateNotifierProvider<AnswerListNotifier, List<Answer>>(
  (ref) {
    return AnswerListNotifier(ref.read);
  },
);
