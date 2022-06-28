import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sbselector/const/theme.dart';

const List<double> _maxRaderChartData = [5.0, 5.0, 5.0, 5.0];

class SnowRadarChart extends HookWidget {
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
                getTitle: (index, angle) {
                  switch (index) {
                    case 0:
                      return const RadarChartTitle(text: 'グラトリ');
                    case 1:
                      return const RadarChartTitle(text: 'カービング');
                    case 2:
                      return const RadarChartTitle(text: 'パウダー');
                    case 3:
                      return const RadarChartTitle(text: 'ジブ・パーク');
                    default:
                      return const RadarChartTitle(text: '');
                  }
                },
                titleTextStyle:
                    Theme.of(context).textTheme.labelMedium,
                // レーダーチャートからのタイトルの位置
                titlePositionPercentageOffset: 0.42,
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
    final context = useContext();
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final maxRadarData = RadarDataSet(
      borderColor: backgroundColor == const Color(0xff303030)
          ? Colors.transparent.withOpacity(0.1)
          : materialWhite.withOpacity(0.1),
      fillColor: backgroundColor == const Color(0xff303030)
          ? Colors.transparent.withOpacity(0.1)
          : materialWhite.withOpacity(0.1),
      borderWidth: 0.0,
      entryRadius: 0.0,
      dataEntries: setEntriesData(_maxRaderChartData),
    );
    list.add(radarData);
    list.add(maxRadarData);
    return list;
  }

  List<RadarEntry>? setEntriesData(List<double> data) {
    List<RadarEntry>? raderEntries =
        data.map((value) => RadarEntry(value: value)).toList();

    return raderEntries;
  }
}
