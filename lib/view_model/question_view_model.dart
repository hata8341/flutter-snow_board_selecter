import 'package:riverpod/riverpod.dart';
import 'package:sbselector/const/question.dart';
import 'package:sbselector/model/question.dart';
import 'package:sbselector/view_model/diagnose_view_model.dart';
// showQuestionSetsでqusetionListを作成
// stateNotifierにQuestionListを作成
// stateProviderを作成
// viewへ順番に出力する

class QuestionList {
  static List<Question> createQestionList() {
    final List<Question> list;

    list = questionBox.map((question) => Question.fromJson(question)).toList();

    return list;
  }
}

class QuestionsController extends StateNotifier<List<Question>> {
  QuestionsController(this.read) : super(QuestionList.createQestionList());

  final Reader read;
}

final questionListProvider =
    StateNotifierProvider<QuestionsController, List<Question>>((ref) {
  return QuestionsController(ref.read);
});

final questionListLengthProvider = Provider<int>((ref) {
  final questionList = ref.watch(questionListProvider);
  return questionList.length;
});

final questionIndexProvider = Provider<int>((ref) {
  final questionSize = ref.watch(questionListLengthProvider);
  final maxIndex = (questionSize - 1).toDouble();
  final indicatorValue =
      ref.watch(diagnoseStateNotifierProvider).indicatorValue;
  if (indicatorValue >= (maxIndex / 10)) return maxIndex.toInt();

  return (indicatorValue * 10).toInt();
});

final questionProvider = Provider<Question>((ref) {
  final questionList = ref.watch(questionListProvider);
  final index = ref.watch(questionIndexProvider);

  return questionList[index];
});
