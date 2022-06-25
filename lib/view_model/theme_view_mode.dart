import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/theme.dart';
import 'package:sbselector/db/theme.dart';
import 'package:sbselector/model/theme_status.dart';
import 'package:sbselector/view_model/page_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStateNotifier extends StateNotifier<ThemeStatus> {
  ThemeStateNotifier(this._read) : super(const ThemeStatus()) {
    _init();
  }

  final Reader _read;

  void _init() async {
    final pref = await SharedPreferences.getInstance();
    final themeMode = await ThemeDb.load(pref);
    final switchStatus = _themeModeToBool(themeMode);
    state = state.copyWith(
      themeMode: themeMode,
      switchStatus: switchStatus,
    );
  }

  void update(bool status) async {
    final ThemeMode mode = _boolToThemeMode(status);
    await ThemeDb.save(mode);
    state = state.copyWith(
      themeMode: mode,
      switchStatus: status,
    );
  }

  ThemeMode _boolToThemeMode(bool status) {
    return status ? ThemeMode.dark : ThemeMode.light;
  }

  bool _themeModeToBool(ThemeMode mode) {
    return mode == ThemeMode.dark ? true : false;
  }

  bool _isTopPagelight() {
    final isTopDiagnose = _read(pageStateProvider.notifier).isDiagnoseTop();
    return isTopDiagnose && state.themeMode != ThemeMode.dark;
  }

  bool _isTopPageDark() {
    final isTopDiagnose = _read(pageStateProvider.notifier).isDiagnoseTop();
    return isTopDiagnose && state.themeMode == ThemeMode.dark;
  }

  Color? getBarColor() {
    if (_isTopPagelight() && !_isTopPageDark()) {
      return Colors.yellow.shade400;
    } else if (!_isTopPagelight() && _isTopPageDark()) {
      return Colors.amber.shade600;
    }
    return null;
  }

  Color? getScaffoldBackgroundColor() {
    if (_isTopPagelight()) {
      return Colors.blue.shade100;
    } else if (_isTopPageDark()) {
      return Colors.deepPurple.shade900;
    }
    return null;
  }

  Color? getAppBarTextIconColor() {
    if (_isTopPagelight() || _isTopPageDark()) {
      return Colors.grey.shade900;
    }
    return null;
  }

  Color? getBubbleColor() {
    if (_isTopPagelight()) {
      return materialWhite;
    } else if (_isTopPageDark()) {
      return Colors.grey.shade900;
    }
    return null;
  }
}

final themeStateProvider =
    StateNotifierProvider.autoDispose<ThemeStateNotifier, ThemeStatus>((ref) {
  return ThemeStateNotifier((ref.read));
});
