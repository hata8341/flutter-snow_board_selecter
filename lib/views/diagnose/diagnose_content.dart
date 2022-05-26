import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/question.dart';
import 'package:sbselector/view_model/diagnose_view_model.dart';
import 'package:sbselector/view_model/question_view_model.dart';
import 'package:sbselector/widgets/bubble.dart';


class DiagnoseContentPage extends HookConsumerWidget {
  const DiagnoseContentPage({Key? key}) : super(key: key);

  final String title = "診断";
  final WeatherType sunny = WeatherType.sunny;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size screenSize = MediaQuery.of(context).size;
    final diagnoseState = ref.watch(diagnoseStateNotifierProvider);
    final indicatorValue = diagnoseState.indicatorValue;
    final String questionNum = ref.watch(questionNumProvider);
    final Question question = ref.watch(questionProvider);
    final bool misIconState = ref.watch(misIconStateProvider);

    checkEndDialog(ref, context);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        titleSpacing: screenSize.width * 0.26,
        title: Row(
          children: <Widget>[
            const Icon(Icons.search),
            Text(title),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WeatherBg(
              weatherType: sunny,
              width: screenSize.width,
              height: screenSize.height,
            ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    constraints: BoxConstraints.expand(
                      height: screenSize.height * 0.17,
                    ),
                  ),
                ),
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
                                  opacity: misIconState ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 200),
                                  child: Visibility(
                                    visible: misIconState,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        mistake(ref);
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
                                          // 戻るアイコンの作成
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: screenSize.width * 0.46,
                                      height: screenSize.height * 0.05,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('はい');
                                          respond(ref, question.category, 5.0);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                          respond(ref, question.category, 1.0);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: screenSize.width * 0.25,
                                      height: screenSize.height * 0.05,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('たぶんそう');
                                          respond(ref, question.category, 4.0);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                          respond(ref, question.category, 3.0);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                          respond(ref, question.category, 2.0);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
          ],
        ),
      ),
    );
  }
}
