import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_status.freezed.dart';

@freezed
class ThemeStatus with _$ThemeStatus {
  const factory ThemeStatus({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(false) bool switchStatus,
  }) = _ThemeStatus;
}
