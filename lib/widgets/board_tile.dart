import 'package:flutter/material.dart';
import 'package:sbselector/model/snowboard.dart';

import 'radar_chart.dart';

ExpansionTile boardTile(
  Snowboard snowboard,
  int recommendNum,
) {
  return ExpansionTile(
    title: Container(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('おすすめ' + recommendNum.toString()),
          Chip(
            elevation: 2.0,
            shadowColor: Colors.grey,
            backgroundColor: Colors.blue[50],
            label: Text(
              snowboard.name,
            ),
          ),
        ],
      ),
    ),
    onExpansionChanged: (bool changed) {},
    children: <Widget>[
      Center(
        child: SnowRadarChart(
          raderChartData: snowboard.chartData,
        ),
      ),
      Image.asset(
        snowboard.imageUrl,
        fit: BoxFit.cover,
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Text(
          snowboard.descprition,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    ],
  );
}
