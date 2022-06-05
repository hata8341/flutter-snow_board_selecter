import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/question.dart';
import 'package:sbselector/view_model/diagnose_view_model.dart';
import 'package:sbselector/view_model/indicator_view_model.dart';
import 'package:sbselector/view_model/question_view_model.dart';
import 'package:sbselector/widgets/bubble.dart';

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
    final String questionNum = questionsController.getQuestionNum();
    final Question question = questionsController.getCurrQuestion();
    final bool missIconState = indicatorValueController.getMissIconState();

    final diagnoseController = ref.watch(diagnoseProvider.notifier);

    diagnoseController.checkEndDialog(ref, context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search),
            Text(title),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Container(
                constraints:
                    BoxConstraints.expand(height: screenSize.height * 0.7),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: screenSize.width * 0.6,
                        height: screenSize.height * 0.32,
                        child: Image.asset(
                          'images/cut_snow_penguin.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.9,
                        height: screenSize.height * 0.22,
                        padding: const EdgeInsets.all(16),
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Color(0x80000000),
                              offset: Offset(0, 2),
                              blurRadius: 2,
                            ),
                          ],
                          shape: BubbleBorder(),
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
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    diagnoseController.missTake();
                                  },
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Icon(
                                  Icons.live_help,
                                  color: Colors.grey,
                                ),
                                AnimatedSwitcher(
                                  duration: const Duration(
                                    seconds: 1,
                                  ),
                                  transitionBuilder: (child, animation) {
                                    return FadeTransition(
                                      opacity: animation.drive(CurveTween(
                                          curve: const Interval(0.6, 1))),
                                      child: child,
                                    );
                                  },
                                  child: SizedBox(
                                    key: ValueKey(questionNum),
                                    height: screenSize.height / 7,
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
                          ],
                        ),
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        minHeight: 10,
                        value: indicatorValue,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.red),
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
                                      print('はい');
                                      diagnoseController.respond(
                                          question.category, 5.0);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow[700],
                                      onPrimary: Colors.black,
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
                                      diagnoseController.respond(
                                          question.category, 1.0);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow[700],
                                      onPrimary: Colors.black,
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
                                      print('たぶんそう');
                                      diagnoseController.respond(
                                          question.category, 4.0);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow[700],
                                      onPrimary: Colors.black,
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
                                      print('わからない');
                                      diagnoseController.respond(
                                          question.category, 3.0);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow[700],
                                      onPrimary: Colors.black,
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
                                      print('たぶん違う');
                                      diagnoseController.respond(
                                          question.category, 2.0);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow[700],
                                      onPrimary: Colors.black,
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
            ),
          ],
        ),
      ),
    );
  }
}
