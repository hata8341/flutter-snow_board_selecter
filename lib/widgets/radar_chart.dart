import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SnowRadarChart extends HookConsumerWidget {
  const SnowRadarChart({
    Key? key,
    required this.raderChartData,
  }) : super(key: key);
  final List<double> raderChartData;
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
                borderData: FlBorderData(show: false),
                dataSets: showingSnowDataSets(),
                radarBackgroundColor: Colors.transparent,
                radarBorderData:
                    const BorderSide(color: Colors.black, width: 2),
                // レーダーチャートの外側のタイトル
                getTitle: (index) {
                  switch (index) {
                    case 0:
                      return 'グラトリ';
                    case 1:
                      return 'カービング';
                    case 2:
                      return 'パウダー';
                    case 3:
                      return 'ジブ・パーク';
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
                tickCount: 4,
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
    List<RadarDataSet> list = [];

    final radarData = RadarDataSet(
      fillColor: Colors.yellow.withOpacity(0.4),
      borderColor: Colors.blueAccent,
      borderWidth: 2.0,
      entryRadius: 5.0,
      dataEntries: setEntriesData(raderChartData),
    );
    list.add(radarData);
    return list;
  }

  List<RadarEntry>? setEntriesData(List<double> data) {
    List<RadarEntry>? raderEntries =
        data.map((value) => RadarEntry(value: value)).toList();

    return raderEntries;
  }
}
