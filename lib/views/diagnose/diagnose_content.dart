import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/question.dart';
import 'package:sbselector/view_model/diagnose_view_model.dart';
import 'package:sbselector/view_model/indicator_view_model.dart';
import 'package:sbselector/view_model/question_view_model.dart';
import 'package:sbselector/view_model/theme_view_mode.dart';
import 'package:sbselector/widgets/bubble.dart';
import 'package:sbselector/widgets/end_dialog.dart';

class DiagnoseContentPage extends HookConsumerWidget {
  const DiagnoseContentPage({Key? key}) : super(key: key);

  final String title = "診断";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size screenSize = MediaQuery.of(context).size;

    final indicatorValue = ref.watch(indicatorStateNotifierProvider);
    final indicatorValueController =
        ref.watch(indicatorStateNotifierProvider.notifier);
    final questionsController = ref.watch(questionListProvider.notifier);
    final diagnoseController = ref.watch(diagnoseProvider.notifier);
    final themeStateController = ref.watch(themeStateProvider.notifier);

    final String questionNum = questionsController.getQuestionNum();
    final Question question = questionsController.getCurrQuestion();
    final String imageUrl = questionsController.getImageUrl();
    final bool missIconState = indicatorValueController.getMissIconState();

    ref.listen(indicatorStateNotifierProvider, (previous, next) {
      if (next == 1.0) {
        showSelfDialog(endDialog(context, ref));
      }
    });

    return Scaffold(
      backgroundColor: themeStateController.getScaffoldBackgroundColor(),
      appBar: AppBar(
        backgroundColor: themeStateController.getBarColor(),
        iconTheme: const IconThemeData.fallback().copyWith(
          color: themeStateController.getAppBarTextIconColor(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              color: themeStateController.getAppBarTextIconColor(),
            ),
            Text(
              title,
              style: TextStyle(
                color: themeStateController.getAppBarTextIconColor(),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: screenSize.width * 0.65,
                height: screenSize.height * 0.32,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fitHeight,
                    key: ValueKey<String>(imageUrl),
                  ),
                ),
              ),
              Container(
                width: screenSize.width * 0.9,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: themeStateController.getBubbleColor(),
                  shadows: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                  shape: const BubbleBorder(),
                ),
                child: Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: missIconState ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Visibility(
                        visible: missIconState,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                          onPressed: () {
                            diagnoseController.missTake();
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Icon(
                            Icons.live_help,
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(
                              seconds: 1,
                            ),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation.drive(
                                    CurveTween(curve: const Interval(0.6, 1))),
                                child: child,
                              );
                            },
                            child: SizedBox(
                              key: ValueKey(questionNum),
                              height: screenSize.height * 0.18,
                              child: Column(
                                children: [
                                  Text(
                                    '質問$questionNum',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      height: 2.0,
                                    ),
                                  ),
                                  Text(
                                    question.content,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              LinearProgressIndicator(
                backgroundColor: Colors.grey.shade300,
                color: themeStateController.getBarColor(),
                minHeight: 10,
                value: indicatorValue,
              ),
              Container(
                width: screenSize.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: screenSize.width * 0.46,
                          height: screenSize.height * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              diagnoseController.respond(question.category, 5);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: themeStateController.getBarColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'はい',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.46,
                          height: screenSize.height * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              diagnoseController.respond(question.category, 1);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: themeStateController.getBarColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'いいえ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap.expand(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: screenSize.width * 0.25,
                          height: screenSize.height * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              diagnoseController.respond(question.category, 4);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: themeStateController.getBarColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'だぶんそう',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.25,
                          height: screenSize.height * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              diagnoseController.respond(question.category, 3);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: themeStateController.getBarColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'わからない',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.25,
                          height: screenSize.height * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              diagnoseController.respond(question.category, 2);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: themeStateController.getBarColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'たぶん違う',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
