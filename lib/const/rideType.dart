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
    switch (this) {
      case RideType.grandTrickJib:
        data = snowboardMap[name]!.first;
        return Snowboard.fromJson(data);
      case RideType.freerunPowder:
        data = snowboardMap[name]!.first;
        return Snowboard.fromJson(data);
      case RideType.allRound:
        data = snowboardMap[name]!.first;
        return Snowboard.fromJson(data);
    }
  }

  Snowboard get secondRecommendBoard {
    Map<String, Object> data;
    switch (this) {
      case RideType.grandTrickJib:
        data = snowboardMap[name]!.last;
        return Snowboard.fromJson(data);
      case RideType.freerunPowder:
        data = snowboardMap[name]!.last;
        return Snowboard.fromJson(data);
      case RideType.allRound:
        data = snowboardMap[name]!.last;
        return Snowboard.fromJson(data);
    }
  }

  String get discription {
    switch (this) {
      case RideType.grandTrickJib:
        return resultMap[name]!['discription']!;
      case RideType.freerunPowder:
        return resultMap[name]!['discription']!;
      case RideType.allRound:
        return resultMap[name]!['discription']!;
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
