import 'package:flutter/material.dart';
import 'package:sbselector/const/result.dart';
import 'package:sbselector/const/snowboard.dart';
import 'package:sbselector/model/snowboard.dart';

enum RideType {
  grandTrickJib,
  freerunPowder,
  allRound,
}

extension RideTypeExt on RideType {
  String get nameJp {
    switch (this) {
      case RideType.grandTrickJib:
        return 'ジブ・グラトリ';
      case RideType.freerunPowder:
        return 'フリーラン・パウダー';
      case RideType.allRound:
        return 'オールラウンド';
    }
  }

  Snowboard get firstRecommendBoard {
    Map<String, Object> data;
    Set<Map<String, Object>> snowboard =
        snowboardMap[name] as Set<Map<String, Object>>;
    switch (this) {
      case RideType.grandTrickJib:
        data = snowboard.first;
        return Snowboard.fromJson(data);
      case RideType.freerunPowder:
        data = snowboard.first;
        return Snowboard.fromJson(data);
      case RideType.allRound:
        data = snowboard.first;
        return Snowboard.fromJson(data);
    }
  }

  Snowboard get secondRecommendBoard {
    Map<String, Object> data;
    Set<Map<String, Object>> snowboardName =
        snowboardMap[name] as Set<Map<String, Object>>;
    switch (this) {
      case RideType.grandTrickJib:
        data = snowboardName.last;
        return Snowboard.fromJson(data);
      case RideType.freerunPowder:
        data = snowboardName.last;
        return Snowboard.fromJson(data);
      case RideType.allRound:
        data = snowboardName.last;
        return Snowboard.fromJson(data);
    }
  }

  String get discription {
    Map<String, String> result = resultMap[name] as Map<String, String>;
    switch (this) {
      case RideType.grandTrickJib:
        return result['discription'] as String;
      case RideType.freerunPowder:
        return result['discription'] as String;
      case RideType.allRound:
        return result['discription'] as String;
    }
  }

  String get iconInitial {
    switch (this) {
      case RideType.grandTrickJib:
        return 'JG';
      case RideType.freerunPowder:
        return 'FP';
      case RideType.allRound:
        return 'AR';
    }
  }

  Color get iconColor {
    switch (this) {
      case RideType.grandTrickJib:
        return Colors.teal;
      case RideType.freerunPowder:
        return Colors.deepPurple;
      case RideType.allRound:
        return Colors.deepOrangeAccent;
    }
  }
}
