import 'package:riverpod/riverpod.dart';
import 'package:sbselector/const/question.dart';
import 'package:sbselector/model/question.dart';
import 'package:sbselector/view_model/indicator_view_model.dart';

class QuestionList {
  static List<Question> createQestionList() {
    final List<Question> list;

    list = questionBox.map((question) => Question.fromJson(question)).toList();

    return list;
  }
}

class QuestionsController extends StateNotifier<List<Question>> {
  QuestionsController(this._read) : super(QuestionList.createQestionList());

  final Reader _read;

  int _getCurrIndex() {
    final indicatorValue = _read(indicatorStateNotifierProvider);
    final questionLen = state.length;
    final maxIndex = (questionLen - 1).toDouble();
    if (indicatorValue >= (maxIndex / 10)) return maxIndex.toInt();
    return (indicatorValue * 10).toInt();
  }

  Question getCurrQuestion() {
    final index = _getCurrIndex();
    return state[index];
  }

  String getQuestionNum() {
    final index = _getCurrIndex();
    return (index + 1).toString();
  }
}

final questionListProvider =
    StateNotifierProvider.autoDispose<QuestionsController, List<Question>>(
        (ref) {
  return QuestionsController(ref.read);
});
