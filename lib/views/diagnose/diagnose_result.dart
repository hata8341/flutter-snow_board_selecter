import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sbselector/const/result.dart';
import 'package:sbselector/model/result.dart';
import 'package:sbselector/widgets/radar_chart.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class DiagnoseResultPage extends HookConsumerWidget {
  DiagnoseResultPage({Key? key}) : super(key: key);

  String title = "診断結果";
  final WeatherType sunny = WeatherType.sunny;
  bool cute = false;
  bool beautiful = false;

  double size = 50;
  double opacity = 1.0;

  final _screenShotController = ScreenshotController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String rideType =
        ModalRoute.of(context)!.settings.arguments.toString();

    final Size screenSize = MediaQuery.of(context).size;

    final Result result = createResultData(rideType);
    print('ホーム');
    print(result);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName('/diagnoseTop'),
            );
          },
        ),
        titleSpacing: screenSize.width * 0.26,
        title: Row(
          children: <Widget>[
            const Icon(Icons.search),
            Text(title),
          ],
        ),
      ),
      body: SafeArea(
        child: Screenshot(
          controller: _screenShotController,
          child: ListView(
            children: <Widget>[
              const Gap(20),
              ListTile(
                title: Row(
                  children: [
                    const Text('あなたのライドスタイルは'),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          '...',
                          speed: const Duration(
                            milliseconds: 1000,
                          ),
                        ),
                        TyperAnimatedText(
                          '...',
                          speed: const Duration(
                            milliseconds: 1000,
                          ),
                        ),
                        TyperAnimatedText(
                          '...',
                          speed: const Duration(
                            milliseconds: 1000,
                          ),
                        ),
                        TyperAnimatedText(
                          '...',
                          speed: const Duration(
                            milliseconds: 1000,
                          ),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: const Duration(seconds: 1),
                      isRepeatingAnimation: false,
                      onFinished: () {
                        print('終わったら');
                        print(size);
                        size = 50;
                        print(size);
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      child: AnimatedDefaultTextStyle(
                        child: Text(result.rideType),
                        style: TextStyle(fontSize: size, color: Colors.black),
                        duration: const Duration(
                          seconds: 1,
                        ),
                        onEnd: () {
                          print('scale_end');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('タイプです！！'),
                  ],
                ),
              ),
              const Gap(20),
              ListTile(
                title: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blue,
                        width: 5.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.snowboarding),
                      Text(
                        'スノーボード',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              ExpansionTile(
                title: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('おすすめ１'),
                      Chip(
                        elevation: 2.0,
                        shadowColor: Colors.grey,
                        backgroundColor: Colors.blue[50],
                        label: Text(
                          result.firstRecommendBoard.name,
                        ),
                      ),
                    ],
                  ),
                ),
                onExpansionChanged: (bool changed) {},
                children: <Widget>[
                  Center(
                    child: SnowRadarChart(
                      raderChartData: result.firstRecommendBoard.chartData,
                    ),
                  ),
                  Image.asset(
                    result.firstRecommendBoard.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                    child: Text(
                      result.firstRecommendBoard.descprition,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('おすすめ2'),
                      Chip(
                        elevation: 2.0,
                        shadowColor: Colors.grey,
                        backgroundColor: Colors.blue[50],
                        label: Text(
                          result.secondRecommendBoard.name,
                        ),
                      ),
                    ],
                  ),
                ),
                onExpansionChanged: (bool changed) {},
                children: <Widget>[
                  Center(
                    child: SnowRadarChart(
                      raderChartData: result.secondRecommendBoard.chartData,
                    ),
                  ),
                  Image.asset(
                    result.secondRecommendBoard.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                    child: Text(
                      result.secondRecommendBoard.descprition,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Text(
                  result.discription,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // 実装を分ける
                      // try-catch文
                      try {
                        _shareResult();
                      } catch (e) {
                        print(e);
                      }
                    },
                    label: const Text('share'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // 結果を保存する実装
                      _saveResult();
                    },
                    label: const Text('share'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _shareResult() async {
    const _shareText = '#スノボセレクター';
    final _screenshot = await _screenShotController.capture(
      delay: const Duration(milliseconds: 10),
    );
    if (_screenshot != null) {
      final _documentDirectoryPath = await getApplicationDocumentsDirectory();
      final imagePath =
          await File('${_documentDirectoryPath.path}/screenshot.png').create();
      await imagePath.writeAsBytes(_screenshot);
      await Share.shareFiles([imagePath.path], text: _shareText);
      await imagePath.delete();
    }
  }

  void _saveResult() async {
    try {
      final _screenshot = await _screenShotController.capture(
        delay: const Duration(milliseconds: 10),
      );
      if (_screenshot != null) {
        print('保存する');
      }
    } catch (e) {
      print(e);
    }
    print('test');
  }
}
