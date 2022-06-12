// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'theme_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThemeStatus {
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  bool get switchStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStatusCopyWith<ThemeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStatusCopyWith<$Res> {
  factory $ThemeStatusCopyWith(
          ThemeStatus value, $Res Function(ThemeStatus) then) =
      _$ThemeStatusCopyWithImpl<$Res>;
  $Res call({ThemeMode themeMode, bool switchStatus});
}

/// @nodoc
class _$ThemeStatusCopyWithImpl<$Res> implements $ThemeStatusCopyWith<$Res> {
  _$ThemeStatusCopyWithImpl(this._value, this._then);

  final ThemeStatus _value;
  // ignore: unused_field
  final $Res Function(ThemeStatus) _then;

  @override
  $Res call({
    Object? themeMode = freezed,
    Object? switchStatus = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      switchStatus: switchStatus == freezed
          ? _value.switchStatus
          : switchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ThemeStatusCopyWith<$Res>
    implements $ThemeStatusCopyWith<$Res> {
  factory _$$_ThemeStatusCopyWith(
          _$_ThemeStatus value, $Res Function(_$_ThemeStatus) then) =
      __$$_ThemeStatusCopyWithImpl<$Res>;
  @override
  $Res call({ThemeMode themeMode, bool switchStatus});
}

/// @nodoc
class __$$_ThemeStatusCopyWithImpl<$Res> extends _$ThemeStatusCopyWithImpl<$Res>
    implements _$$_ThemeStatusCopyWith<$Res> {
  __$$_ThemeStatusCopyWithImpl(
      _$_ThemeStatus _value, $Res Function(_$_ThemeStatus) _then)
      : super(_value, (v) => _then(v as _$_ThemeStatus));

  @override
  _$_ThemeStatus get _value => super._value as _$_ThemeStatus;

  @override
  $Res call({
    Object? themeMode = freezed,
    Object? switchStatus = freezed,
  }) {
    return _then(_$_ThemeStatus(
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      switchStatus: switchStatus == freezed
          ? _value.switchStatus
          : switchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ThemeStatus implements _ThemeStatus {
  const _$_ThemeStatus(
      {this.themeMode = ThemeMode.system, this.switchStatus = false});

  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final bool switchStatus;

  @override
  String toString() {
    return 'ThemeStatus(themeMode: $themeMode, switchStatus: $switchStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThemeStatus &&
            const DeepCollectionEquality().equals(other.themeMode, themeMode) &&
            const DeepCollectionEquality()
                .equals(other.switchStatus, switchStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(themeMode),
      const DeepCollectionEquality().hash(switchStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ThemeStatusCopyWith<_$_ThemeStatus> get copyWith =>
      __$$_ThemeStatusCopyWithImpl<_$_ThemeStatus>(this, _$identity);
}

abstract class _ThemeStatus implements ThemeStatus {
  const factory _ThemeStatus(
      {final ThemeMode themeMode, final bool switchStatus}) = _$_ThemeStatus;

  @override
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  @override
  bool get switchStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ThemeStatusCopyWith<_$_ThemeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
