import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension ThemeModeEx on ThemeMode {
  String get key => toString().split('.').first;
  String get values => toString().split('.').last;
}

const defalutTheme = ThemeMode.system;

class ThemeDb {
  Future<void> save(ThemeMode mode) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(mode.key, mode.name);
  }

  Future<ThemeMode> load(SharedPreferences? pref) async {
    if (pref != null) {
      return _toMode(pref.getString(defalutTheme.key) ?? defalutTheme.name);
    }

    pref = await SharedPreferences.getInstance();
    return _toMode(pref.getString(defalutTheme.key) ?? defalutTheme.name);
  }

  Future<ThemeMode> _toMode(String str) async {
    return ThemeMode.values.where((value) => value.name == str).first;
  }
}

final themeDbProvider = Provider.autoDispose<ThemeDb>((ref) {
  return ThemeDb();
});
