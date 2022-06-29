import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/views/diagnose/diagnose_top.dart';
import 'package:sbselector/views/history/history_top.dart';
import 'package:sbselector/views/settings/setting_top.dart';

enum BottomBarIndex {
  zero(0),
  one(1),
  two(2);

  const BottomBarIndex(this.value);
  final int value;

  String get title {
    switch (value) {
      case 0:
        return '履歴';
      case 1:
        return '診断';
      case 2:
        return '設定';
    }
    return '';
  }

  Color get backgroundColor {
    switch (value) {
      case 0:
        return Colors.white;
      case 1:
        return Colors.blue.shade200;
      case 2:
        return Colors.white;
    }
    return Colors.white;
  }

  IconData get icon {
    switch (value) {
      case 0:
        return Icons.list;
      case 1:
        return Icons.search;
      case 2:
        return Icons.settings;
    }
    return Icons.error;
  }

  ConsumerWidget get page {
    switch (value) {
      case 0:
        return const HistoryTopPage();
      case 1:
        return const DiagnoseTopPage();
      case 2:
        return const SettingList();
    }
    return const DiagnoseTopPage();
  }
}
