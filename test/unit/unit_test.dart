import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/question.dart';
import 'package:sbselector/model/answer.dart';
import 'package:sbselector/model/question.dart';
import 'package:sbselector/view_model/answer_view_model.dart';
import 'package:sbselector/view_model/indicator_view_model.dart';
import 'package:sbselector/view_model/question_view_model.dart';

void main() {
  group('questionList test', () {
    const Set<Map<String, Object>> questionsOrigin = questionBox;
    test('questionList constructor 10', () {
      final List<Question> questionList = questionsOrigin
          .map((question) => Question.fromJson(question))
          .toList();

      final int groundtrickJibListSize = questionList
          .where((question) => question.category == 'groundtrickJib')
          .toList()
          .length;

      final int originGroundtrickJibListSize = questionsOrigin
          .where((question) => question['category'] == 'groundtrickJib')
          .toList()
          .length;

      expect(groundtrickJibListSize, originGroundtrickJibListSize);

      final int freerunPowderListSize = questionList
          .where((question) => question.category == 'freerunPowder')
          .toList()
          .length;

      final int originFreerunPowderListSize = questionsOrigin
          .where((question) => question['category'] == 'freerunPowder')
          .toList()
          .length;

      expect(freerunPowderListSize, originFreerunPowderListSize);

      final int questionListSize = questionList.length;
      final int questionsOriginSize = questionsOrigin.length;

      expect(questionListSize, questionsOriginSize);
    });

    final questionListProvider = StateNotifierProvider.autoDispose<
        QuestionListStateNotifier, List<Question>>((ref) {
      return QuestionListStateNotifier(ref.read);
    });
    final target = ProviderContainer(overrides: [
      questionListProvider.overrideWithProvider(questionListProvider),
      indicatorStateNotifierProvider.overrideWithValue(
        IndicatorStateNotifier(),
      ),
    ]);

    test('question num test', () {
      expect(target.read(questionListProvider.notifier).getQuestionNum(), '1');
      target
          .read(indicatorStateNotifierProvider.notifier)
          .incrementIndicatorValue();
      expect(target.read(questionListProvider.notifier).getQuestionNum(), '2');
    });

    test('exist curr question test', () {
      final currQuestion =
          target.read(questionListProvider.notifier).getCurrQuestion();
      final isQuesion =
          target.read(questionListProvider).contains(currQuestion);
      expect(isQuesion, true);

      target
          .read(indicatorStateNotifierProvider.notifier)
          .incrementIndicatorValue();
      final currQuestion2 =
          target.read(questionListProvider.notifier).getCurrQuestion();
      expect(target.read(questionListProvider).contains(currQuestion2), true);
    });

    test('quesion penguin image test', () {
      final imageTop = target.read(questionListProvider.notifier).getImageUrl();
      expect(imageTop, 'images/snow_penguin_top.png');

      for (var i = 0; i < 3; i++) {
        target
            .read(indicatorStateNotifierProvider.notifier)
            .incrementIndicatorValue();
      }
      final imaeg1 = target.read(questionListProvider.notifier).getImageUrl();

      expect(imaeg1, 'images/snow_penguin_1.png');
      for (var i = 0; i < 3; i++) {
        target
            .read(indicatorStateNotifierProvider.notifier)
            .incrementIndicatorValue();
      }
      final imaeg2 = target.read(questionListProvider.notifier).getImageUrl();

      expect(imaeg2, 'images/snow_penguin_2.png');

      for (var i = 0; i < 3; i++) {
        target
            .read(indicatorStateNotifierProvider.notifier)
            .incrementIndicatorValue();
      }
      final imaeg3 = target.read(questionListProvider.notifier).getImageUrl();

      expect(imaeg3, 'images/snow_penguin_3.png');
    });
  });
  group('indicator test', () {
    final target = ProviderContainer(
      overrides: [
        indicatorStateNotifierProvider.overrideWithValue(
          IndicatorStateNotifier(),
        ),
      ],
    );
    test('increment indicator  test', () {
      expect(target.read(indicatorStateNotifierProvider), 0.0);

      target
          .read(indicatorStateNotifierProvider.notifier)
          .incrementIndicatorValue();
      expect(target.read(indicatorStateNotifierProvider), 0.1);
    });
    test('decrement indicator test', () {
      expect(target.read(indicatorStateNotifierProvider), 0.0);

      target
          .read(indicatorStateNotifierProvider.notifier)
          .incrementIndicatorValue();
      expect(target.read(indicatorStateNotifierProvider), 0.1);

      target
          .read(indicatorStateNotifierProvider.notifier)
          .decrementIndicatorValue();
      expect(target.read(indicatorStateNotifierProvider), 0.0);
    });

    test('missIcon status test', () {
      final defalutStatus = target
          .read(indicatorStateNotifierProvider.notifier)
          .getMissIconState();
      expect(defalutStatus, false);

      target
          .read(indicatorStateNotifierProvider.notifier)
          .incrementIndicatorValue();
      final updateStatus = target
          .read(indicatorStateNotifierProvider.notifier)
          .getMissIconState();
      expect(updateStatus, true);
    });
  });

  group('answerList test', () {
    final answerListProvider =
        StateNotifierProvider<AnswerListNotifier, List<Answer>>(
      (ref) {
        return AnswerListNotifier(ref.read);
      },
    );
    final target = ProviderContainer(overrides: [answerListProvider]);

    final defalutList = target.read(answerListProvider);

    final questionList = target.read(questionListProvider);

    test('add anserList test', () {
      expect(defalutList.length, 0);

      const answer = Answer(category: 'groundtrickJib', answerValue: 1);

      target.read(answerListProvider.notifier).addAnswer(answer);

      final addAnswerList = target.read(answerListProvider);

      expect(addAnswerList.length, 1);
    });

    test('remove answerList test', () {
      expect(defalutList.length, 0);

      const answer = Answer(category: 'groundtrickJib', answerValue: 1);
      target.read(answerListProvider.notifier).addAnswer(answer);

      final addAnswerList = target.read(answerListProvider);

      expect(addAnswerList.length, 1);

      target.read(answerListProvider.notifier).removeAnswer();

      final removeAnswerList = target.read(answerListProvider);

      expect(removeAnswerList.length, 0);
    });

    test('createJGList test', () {

      for (var question in questionList) {
        int randomNum = 1 + Random().nextInt(5);
        final answer =
            Answer(category: question.category, answerValue: randomNum);
        target.read(answerListProvider.notifier).addAnswer(answer);
      }

      final isNotEmpty = target.read(answerListProvider).isNotEmpty;
      expect(isNotEmpty, true);

      final jGList = target.read(answerListProvider.notifier).createJGList();
      bool isAllJGList = true;
      for (var anwser in jGList) {
        if (anwser.category == 'freerunPowder') {
          isAllJGList = false;
        }
      }
      expect(isAllJGList, true);
    });

    test('createFPList test', () {
      for (var question in questionList) {
        int randomNum = 1 + Random().nextInt(5);
        final answer =
            Answer(category: question.category, answerValue: randomNum);
        target.read(answerListProvider.notifier).addAnswer(answer);
      }

      final isNotEmpty = target.read(answerListProvider).isNotEmpty;

      expect(isNotEmpty, true);

      final fPList = target.read(answerListProvider.notifier).createFPList();
      bool isAllFPList = true;
      for (var anwser in fPList) {
        if (anwser.category == 'groundtrickJib') {
          isAllFPList = false;
        }
      }
      expect(isAllFPList, true);
    });

    test('reset test', () {
      expect(defalutList, []);

      for (var question in questionList) {
        int randomNum = 1 + Random().nextInt(5);
        final answer =
            Answer(category: question.category, answerValue: randomNum);
        target.read(answerListProvider.notifier).addAnswer(answer);
      }
      final isNotEmptyAnswer = target.read(answerListProvider).isNotEmpty;
      expect(isNotEmptyAnswer, true);

      target.read(answerListProvider.notifier).resetState();

      final isEmptyAnswer = target.read(answerListProvider).isEmpty;

      expect(isEmptyAnswer, true);
    });
  });
}
