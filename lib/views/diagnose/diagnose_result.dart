import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sbselector/widgets/radar_chart.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class DiagnoseResultPage extends HookConsumerWidget {
  DiagnoseResultPage({Key? key}) : super(key: key);

  String title = "診断結果";
  final WeatherType sunny = WeatherType.sunny;
  bool cute = false;
  bool beautiful = false;

  final _screenShotController = ScreenshotController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rideType = ModalRoute.of(context)!.settings.arguments;

    print('引数$rideType');

    final Size screenSize = MediaQuery.of(context).size;
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
              // スタンス・ライドスタイル
              Material(
                elevation: 1.0,
                shadowColor: Colors.blueGrey,
                child: ListTile(
                  tileColor: Colors.grey[100],
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'スタンス・ライドスタイル',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ExpansionTile(
                title: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('推奨スタンス'),
                      Chip(
                        backgroundColor: Colors.blue[50],
                        label: const Text(
                          'レギュラー・ダック',
                        ),
                      ),
                    ],
                  ),
                ),
                onExpansionChanged: (bool changed) {
                  // setState(() {
                  //   cute = false;
                  //   beautiful = changed;
                },
                children: <Widget>[
                  CheckboxListTile(
                    value: cute,
                    onChanged: (checked) {
                      // setState(() {
                      //   cute = checked!;
                      // });
                    },
                    title: const Text('可愛い系'),
                  ),
                  CheckboxListTile(
                    value: beautiful,
                    onChanged: (checked) {
                      // setState(() {
                      //   beautiful = checked!;
                      // });
                    },
                    title: const Text('美人系'),
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
                      const Text('推奨ライド'),
                      Chip(
                        backgroundColor: Colors.blue[50],
                        label: const Text(
                          'フリーラン',
                        ),
                      ),
                    ],
                  ),
                ),
                onExpansionChanged: (bool changed) {
                  // setState(() {
                  //   cute = false;
                  //   beautiful = changed;
                },
                children: const <Widget>[
                  SizedBox(
                    height: 50,
                    child: Text('あなたはフリーランでライドスタイルを楽しむ傾向があります'),
                  ),
                ],
              ),
              Material(
                elevation: 1.0,
                shadowColor: Colors.blueGrey,
                child: ListTile(
                  tileColor: Colors.grey[100],
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'スノーボード',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.green,
                //     width: 2,
                //   ),
                // ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      // RadarChartSample1(),
                      SnowRadarChart(),
                    ],
                  ),
                ),
              ),
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
                        backgroundColor: Colors.blue[50],
                        label: const Text(
                          'キャンバー',
                        ),
                      ),
                    ],
                  ),
                ),
                onExpansionChanged: (bool changed) {
                  // setState(() {
                  //   cute = false;
                  //   beautiful = changed;
                },
                children: const <Widget>[
                  SizedBox(
                    height: 50,
                    child: Text('雪面にエッジが引っかかりやすい形状'),
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
                        backgroundColor: Colors.blue[50],
                        label: const Text(
                          'ロッカーキャンバー',
                        ),
                      ),
                    ],
                  ),
                ),
                onExpansionChanged: (bool changed) {
                  // setState(() {
                  //   cute = false;
                  //   beautiful = changed;
                },
                children: const <Widget>[
                  SizedBox(
                    height: 50,
                    child: Text('板のノーズが雪に埋まりにくい形状'),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: const Text(
                  'あなたはレギュラースタンスの前振りスタンスが推奨スタンスです。圧雪バーンでカービングターンをしたり、コース脇などのパウダースノーで浮遊感を感じたり、壁などを使った地形遊びをするライドスタイルに興味があるようです。そんな人には雪面にエッジが上手くかかるキャンバー、板のノーズが雪に埋まりにくいロッカーキャンバーのような形状の板がおすすめ！！',
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
