import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SnowRadarChart extends HookConsumerWidget {
  const SnowRadarChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1.6,
            child: RadarChart(
              RadarChartData(
                // 仮に1つ定義
                borderData: FlBorderData(show: false),
                dataSets: showingSnowDataSets(),
                radarBackgroundColor: Colors.transparent,
                radarBorderData:
                    const BorderSide(color: Colors.black, width: 2),
                // レーダーチャートの外側のタイトル
                getTitle: (index) {
                  switch (index) {
                    case 0:
                      return 'ジブ・グラトリ';
                    case 1:
                      return 'オールラウンド';
                    case 2:
                      return 'フリーラン・パウダー';
                    default:
                      return '';
                  }
                },
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                // レーダーチャートからのタイトルの位置
                titlePositionPercentageOffset: 0.2,
                // ティックの数
                tickCount: 5,
                ticksTextStyle: const TextStyle(
                  color: null,
                  fontSize: 0,
                ),
                tickBorderData: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                gridBorderData: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                // radarTouchData: RadarTouchData(),
              ),
              swapAnimationDuration: const Duration(milliseconds: 150),
              swapAnimationCurve: Curves.linear,
            ),
          )
        ],
      ),
    );
  }

  List<RadarDataSet> showingSnowDataSets() {
    return snowDataSets().asMap().entries.map((entry) {
      var index = entry.key;
      var snowData = entry.value;

      return RadarDataSet(
        fillColor: Colors.yellow.withOpacity(0.4),
        borderColor: Colors.blueAccent,
        borderWidth: 2.0,
        entryRadius: 5.0,
        dataEntries:
            snowData.pointList.map((e) => RadarEntry(value: e)).toList(),
      );
    }).toList();
  }

  List<SnowData> snowDataSets() {
    return [
      SnowData(
        title: 'フリーラン・パウダー',
        pointList: [2.0, 2.0, 6.0],
      ),
      // SnowData(
      //   title: 'ジブ・グラトリ',
      //   pointList: [6.0, 2.0, 2.0],
      // ),
      // SnowData(
      //   title: 'オールラウンド',
      //   pointList: [2.0, 6.0, 2.0],
      // ),
    ];
  }
}

class SnowData {
  final String title;
  final List<double> pointList;

  SnowData({
    required this.title,
    required this.pointList,
  });
}
