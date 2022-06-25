import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sbselector/const/bottom_bar_index.dart';
import 'package:sbselector/const/question.dart';
import 'package:sbselector/const/result.dart';
import 'package:sbselector/const/ridetype.dart';
import 'package:sbselector/const/snowboard.dart';
import 'package:sbselector/db/result.dart';
import 'package:sbselector/model/answer.dart';
import 'package:sbselector/model/page_state.dart';
import 'package:sbselector/model/question.dart';
import 'package:sbselector/model/result.dart';
import 'package:sbselector/model/snowboard.dart';
import 'package:sbselector/model/theme_status.dart';
import 'package:sbselector/view_model/answer_view_model.dart';
import 'package:sbselector/view_model/indicator_view_model.dart';
import 'package:sbselector/view_model/question_view_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:uuid/uuid.dart';

Future main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });
  group('question test', () {
    const questionData = {
      'id': 1,
      'category': 'groundtrickJib',
      'content': 'スノーボードで雪の上を回ったり、ジャンプしたりしたいですか？',
    };
    test('question contstructor test', () {
      final target = Question(
        category: questionData['category'] as String,
        content: questionData['content'] as String,
      );

      final fromJsonQuestion = Question.fromJson(questionData);

      expect(target, fromJsonQuestion);
    });
    const Set<Map<String, Object>> questionsOrigin = questionBox;
    test('questionList constructor 10 test', () {
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

    test('question num test', () {
      final target = ProviderContainer(overrides: [
        questionListProvider.overrideWithProvider(questionListProvider),
        indicatorStateNotifierProvider.overrideWithValue(
          IndicatorStateNotifier(),
        ),
      ]);
      expect(target.read(questionListProvider.notifier).getQuestionNum(), '1');
      target
          .read(indicatorStateNotifierProvider.notifier)
          .incrementIndicatorValue();
      expect(target.read(questionListProvider.notifier).getQuestionNum(), '2');
    });

    test('exist curr question test', () {
      final target = ProviderContainer(overrides: [
        questionListProvider.overrideWithProvider(questionListProvider),
        indicatorStateNotifierProvider.overrideWithValue(
          IndicatorStateNotifier(),
        ),
      ]);

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
      final target = ProviderContainer(overrides: [
        questionListProvider.overrideWithProvider(questionListProvider),
        indicatorStateNotifierProvider.overrideWithValue(
          IndicatorStateNotifier(),
        ),
      ]);

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
    test('increment indicator  test', () {
      final target = ProviderContainer(
        overrides: [
          indicatorStateNotifierProvider.overrideWithValue(
            IndicatorStateNotifier(),
          ),
        ],
      );
      expect(target.read(indicatorStateNotifierProvider), 0.0);

      target
          .read(indicatorStateNotifierProvider.notifier)
          .incrementIndicatorValue();
      expect(target.read(indicatorStateNotifierProvider), 0.1);
    });
    test('decrement indicator test', () {
      final target = ProviderContainer(
        overrides: [
          indicatorStateNotifierProvider.overrideWithValue(
            IndicatorStateNotifier(),
          ),
        ],
      );
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
      final target = ProviderContainer(
        overrides: [
          indicatorStateNotifierProvider.overrideWithValue(
            IndicatorStateNotifier(),
          ),
        ],
      );
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
    const answerData = {
      'category': 'groundtrickJib',
      'answerValue': 1,
    };
    test('answer test', () {
      final target = Answer(
        category: answerData['category'] as String,
        answerValue: answerData['answerValue'] as int,
      );
      expect(target, isInstanceOf<Answer>());
    });

    test('add anserList test', () {
      final target = ProviderContainer(overrides: [answerListProvider]);
      final defalutList = target.read(answerListProvider);

      expect(defalutList.length, 0);

      const answer = Answer(category: 'groundtrickJib', answerValue: 1);

      target.read(answerListProvider.notifier).addAnswer(answer);

      final addAnswerList = target.read(answerListProvider);

      expect(addAnswerList.length, 1);
    });

    test('remove answerList test', () {
      final target = ProviderContainer(overrides: [answerListProvider]);

      final defalutList = target.read(answerListProvider);

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
      final target = ProviderContainer(overrides: [answerListProvider]);

      final questionList = target.read(questionListProvider);
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
      final target = ProviderContainer(overrides: [answerListProvider]);

      final questionList = target.read(questionListProvider);
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
      final target = ProviderContainer(overrides: [answerListProvider]);

      final defalutList = target.read(answerListProvider);

      final questionList = target.read(questionListProvider);

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
  group('snowboard test', () {
    const snowboardData = {
      'name': 'ダブルキャンバー',
      'descprition':
          'ダブルキャンバーとは股下がロッカーで、両足元がキャンバーの構造をしています。ボードを真横から見たときにアルファベットの「M」もような形状をしています。股下部分のロッカー形状により、板のノーズ・テールが雪面に着きにくく、逆エッジが軽減されます。またロッカー形状により、パウダーでの浮力を得ることができます。',
      'imageUrl': 'images/test_board/w_camber.png',
      'chartData': [4.5, 3.5, 3.5, 4.5],
    };
    test('Snowboard test', () {
      final target = Snowboard(
        name: snowboardData['name'] as String,
        descprition: snowboardData['descprition'] as String,
        imageUrl: snowboardData['imageUrl'] as String,
        chartData: snowboardData['chartData'] as List<double>,
      );
      final fromJsonSnowBoard = Snowboard.fromJson(snowboardData);
      expect(target, fromJsonSnowBoard);
    });
  });

  group('RideType test', () {
    const grandTrickJibType = RideType.grandTrickJib;
    const freerunPowderType = RideType.freerunPowder;
    const allRoundType = RideType.allRound;

    const snowboardData = snowboardMap;
    const resultData = resultMap;
    test('RideType name test', () {
      expect(grandTrickJibType.name, 'grandTrickJib');
      expect(freerunPowderType.name, 'freerunPowder');
      expect(allRoundType.name, 'allRound');
    });

    test('RideType nameJp test', () {
      expect(grandTrickJibType.nameJp, 'ジブ・グラトリ');
      expect(freerunPowderType.nameJp, 'フリーラン・パウダー');
      expect(allRoundType.nameJp, 'オールラウンド');
    });

    test('RideType firstRecommendBoard test', () {
      final grandTrickJibName = grandTrickJibType.name;
      final gJFirstRecommendBoardData =
          snowboardData[grandTrickJibName]?.first as Map<String, dynamic>;
      expect(grandTrickJibType.firstRecommendBoard,
          Snowboard.fromJson(gJFirstRecommendBoardData));

      final freerunPowderName = freerunPowderType.name;
      final fPFirstRecommendBoardData =
          snowboardData[freerunPowderName]?.first as Map<String, dynamic>;
      expect(freerunPowderType.firstRecommendBoard,
          Snowboard.fromJson(fPFirstRecommendBoardData));

      final allRoundName = allRoundType.name;
      final aRFirstRecommendBoardData =
          snowboardData[allRoundName]?.first as Map<String, dynamic>;
      expect(allRoundType.firstRecommendBoard,
          Snowboard.fromJson(aRFirstRecommendBoardData));
    });
    test('RideType secondRecommendBoard test', () {
      final grandTrickJibName = grandTrickJibType.name;
      final gJSecondRecommendBoard =
          snowboardData[grandTrickJibName]?.last as Map<String, dynamic>;
      expect(grandTrickJibType.secondRecommendBoard,
          Snowboard.fromJson(gJSecondRecommendBoard));

      final freerunPowderName = freerunPowderType.name;
      final fPSecondRecommendBoard =
          snowboardData[freerunPowderName]?.last as Map<String, dynamic>;
      expect(freerunPowderType.secondRecommendBoard,
          Snowboard.fromJson(fPSecondRecommendBoard));

      final allRoundName = allRoundType.name;
      final aRSecondRecommendBoard =
          snowboardData[allRoundName]?.last as Map<String, dynamic>;
      expect(allRoundType.secondRecommendBoard,
          Snowboard.fromJson(aRSecondRecommendBoard));
    });

    test('RideType description test', () {
      final grandTrickJibName = grandTrickJibType.name;
      final gJDescriptionData = resultData[grandTrickJibName]?['description'];
      expect(grandTrickJibType.description, gJDescriptionData);

      final freerunPowderName = freerunPowderType.name;
      final fPDescriptionData = resultData[freerunPowderName]?['description'];
      expect(freerunPowderType.description, fPDescriptionData);

      final allRoundName = allRoundType.name;
      final aRDescriptionData = resultData[allRoundName]?['description'];
      expect(allRoundType.description, aRDescriptionData);
    });

    test('RideType IconInitial test', () {
      expect(grandTrickJibType.iconInitial, 'JG');
      expect(freerunPowderType.iconInitial, 'FP');
      expect(allRoundType.iconInitial, 'AR');
    });

    test('RideType IconColor test', () {
      expect(grandTrickJibType.iconColor, Colors.teal);
      expect(freerunPowderType.iconColor, Colors.deepPurple);
      expect(allRoundType.iconColor, Colors.deepOrangeAccent);
    });
  });

  group('Result test', () {
    Map<String, dynamic> resultData = {
      'id': const Uuid().v4(),
      'rideType': RideType.grandTrickJib,
      'createdAt': DateTime.now(),
    };
    RideType rideTypeData = resultData['rideType'] as RideType;
    DateTime createdAtData = resultData['createdAt'] as DateTime;

    final jsonData = {
      'id': resultData['id'],
      'rideType': rideTypeData.name,
      'createdAt': createdAtData.toUtc().toIso8601String(),
    };

    final result = Result(
      id: resultData['id'],
      rideType: resultData['rideType'],
      createdAt: resultData['createdAt'],
    );
    test('result constructor fromMap test', () {
      final target = Result(
        id: resultData['id'],
        rideType: resultData['rideType'],
        createdAt: resultData['createdAt'],
      );

      final fromJsonResult = Result.fromMap(jsonData);

      expect(target, fromJsonResult);
    });

    test('result toMap test', () {
      final target = result.toMap();

      expect(target, jsonData);
    });

    test('result createdAtStr test', () {
      initializeDateFormatting('ja');

      final target = result.createdAtStr;

      final time = DateTime.parse(jsonData['createdAt']).toLocal();
      final ymed = DateFormat.yMEd('ja').format(time);
      final hm = DateFormat.Hm('ja').format(time);
      final createdAtStrData = ymed + hm;

      expect(target, createdAtStrData);
    });
  });

  group('pageState test', () {
    test('pageState contstructor test', () {
      const target = PageState(
        bottomBarIndex: BottomBarIndex.one,
        player: null,
        bgmState: false,
      );
      expect(target is PageState, true);
    });
  });

  group('themeStatus test', () {
    test('themeStatus contstructor test', () {
      const target = ThemeStatus(
        themeMode: ThemeMode.system,
        switchStatus: false,
      );
      expect(target is ThemeStatus, true);
    });
  });

  group('resultDb test', () {
    test('resultDb open  test', () async {
      final target = ProviderContainer(
        overrides: [resultDbProvider],
      );
      final db = await target.read(resultDbProvider).openDb();

      expect(db.isOpen, true);
      await db.close();
    });

    test('resultDb create test', () async {
      final target = ProviderContainer(
        overrides: [resultDbProvider],
      );
      final db = await target.read(resultDbProvider).openDb();
      db.delete(resultTableName);
      final resultData = Result(
        id: const Uuid().v4(),
        rideType: RideType.grandTrickJib,
        createdAt: DateTime.now(),
      );

      await target.read(resultDbProvider).create(resultData);
      final list = await db.query(resultTableName);
      final history = List.generate(list.length, (index) {
        return Result.fromMap(list[index]);
      });

      expect(history[0], resultData);

      await db.close();
    });

    test('resultDb read test', () async {
      final target = ProviderContainer(
        overrides: [resultDbProvider],
      );
      final db = await target.read(resultDbProvider).openDb();
      db.delete(resultTableName);

      final resultData1 = Result(
        id: const Uuid().v4(),
        rideType: RideType.grandTrickJib,
        createdAt: DateTime.now(),
      );
      final resultData2 = Result(
        id: const Uuid().v4(),
        rideType: RideType.grandTrickJib,
        createdAt: DateTime.now(),
      );
      await target.read(resultDbProvider).create(resultData1);
      await target.read(resultDbProvider).create(resultData2);

      final history = await target.read(resultDbProvider).read();
      expect(history.length, 2);

      await db.close();
    });

    test('resultDb delete test', () async {
      final target = ProviderContainer(
        overrides: [resultDbProvider],
      );
      final db = await target.read(resultDbProvider).openDb();
      db.delete(resultTableName);

      final resultData = Result(
        id: const Uuid().v4(),
        rideType: RideType.grandTrickJib,
        createdAt: DateTime.now(),
      );

      await target.read(resultDbProvider).create(resultData);
      final history = await target.read(resultDbProvider).read();
      expect(history.length, 1);

      await target.read(resultDbProvider).delete(resultData.id);
      final history2 = await target.read(resultDbProvider).read();
      expect(history2.length, 0);
      await db.close();
    });
  });

}
