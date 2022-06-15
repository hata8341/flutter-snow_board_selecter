import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SnowRadarChart extends StatelessWidget {
  const SnowRadarChart({
    Key? key,
    required this.raderChartData,
  }) : super(key: key);
  final List<double> raderChartData;
  @override
  Widget build(BuildContext context) {
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
                  fontSize: 16.0,
                ),
                // レーダーチャートからのタイトルの位置
                titlePositionPercentageOffset: 0.2,
                // ティックの数
                tickCount: 4,
                ticksTextStyle: const TextStyle(
                  fontSize: 0,
                ),
                tickBorderData: const BorderSide(
                  width: 2,
                ),
                gridBorderData: const BorderSide(
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
