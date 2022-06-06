import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// historynotifierを作成
class PageNotifier extends StateNotifier<void> {
  PageNotifier(this._read) : super(null);

  final Reader _read;

  String egToJp(String rideType) {
    final String answer;
    switch (rideType) {
      case 'grandTrickJib':
        answer = 'ジブ・グラトリ';
        break;
      case 'freerunPowder':
        answer = 'フリーラン・パウダー';
        break;
      case 'allRound':
        answer = 'オールラウンド';
        break;
      default:
        answer = '';
    }
    return answer;
  }

  String getIconStr(String rideType) {
    switch (rideType) {
      case 'grandTrickJib':
        return 'GT';
      case 'freerunPowder':
        return 'FP';
      case 'allRound':
        return 'AR';
    }
    return '';
  }

  Color getIconColor(String rideType) {
    switch (rideType) {
      case 'grandTrickJib':
        return Colors.teal;
      case 'freerunPowder':
        return Colors.deepPurple;
      case 'allRound':
        return Colors.deepOrangeAccent;
    }
    return Colors.black54;
  }

  String checkWriteInStr(String rideType) {
    if (rideType == 'フリーラン・パウダー') {
      final words = rideType.split('・');
      final strBuffer = StringBuffer(words[0])
        ..writeln()
        ..write(words[1]);
      return strBuffer.toString();
    }

    return '';
  }
}

final pageProvider = StateNotifierProvider<PageNotifier, void>((ref) {
  return PageNotifier((ref.read));
});
