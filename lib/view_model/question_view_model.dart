import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sbselector/const/question.dart';
import 'package:sbselector/model/question.dart';
import 'package:sbselector/view_model/indicator_view_model.dart';

// class _QuestionList {
//   static List<Question> createQestionList() {
//     final List<Question> list;

//     list = questionBox.map((question) => Question.fromJson(question)).toList();
//     // list.shuffle();

//     return list;
//   }
// }

class QuestionListStateNotifier extends StateNotifier<List<Question>> {
  QuestionListStateNotifier(this._read) : super([]) {
    final List<Question> list =
        questionBox.map((question) => Question.fromJson(question)).toList();

    state = list;
  }

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

  String getImageUrl() {
    if (_getCurrIndex() > 7) {
      return 'images/snow_penguin_3.png';
    } else if (_getCurrIndex() > 5) {
      return 'images/snow_penguin_2.png';
    } else if (_getCurrIndex() > 2) {
      return 'images/snow_penguin_1.png';
    } else {
      return 'images/snow_penguin_top.png';
    }
  }
}

final questionListProvider = StateNotifierProvider.autoDispose<
    QuestionListStateNotifier, List<Question>>((ref) {
  return QuestionListStateNotifier(ref.read);
});
