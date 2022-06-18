import 'package:flutter/material.dart';
import 'package:sbselector/model/snowboard.dart';

import 'radar_chart.dart';

ExpansionTile boardTile(
    ScrollController _scrollController, Snowboard snowboard, int recommendNum) {

  final GlobalKey expansionTileKey = GlobalKey();
  void _scrollToSelectedContent({GlobalKey? expansionTileKey}) {
    final keyContent = expansionTileKey!.currentContext;
    Future.delayed(const Duration(milliseconds: 200)).then((value) =>
        Scrollable.ensureVisible(keyContent!,
            duration: const Duration(milliseconds: 200)));
  }

  return ExpansionTile(
    key: expansionTileKey,
    title: Container(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'おすすめ' + recommendNum.toString(),
            style: const TextStyle(fontSize: 20.0),
          ),
          Chip(
            elevation: 2.0,
            label: Text(
              snowboard.name,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    ),
    onExpansionChanged: (bool isExpanded) {
      if (isExpanded) {
        _scrollToSelectedContent(expansionTileKey: expansionTileKey);
      }
    },
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
        padding: const EdgeInsets.fromLTRB(22.0, 0.0, 20.0, 16.0),
        child: Text(
          snowboard.descprition,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    ],
  );
}
