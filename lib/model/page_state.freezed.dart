// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PageState {
  BottomBarIndex get bottomBarIndex => throw _privateConstructorUsedError;
  AudioPlayer? get player => throw _privateConstructorUsedError;
  bool get bgmState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageStateCopyWith<PageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageStateCopyWith<$Res> {
  factory $PageStateCopyWith(PageState value, $Res Function(PageState) then) =
      _$PageStateCopyWithImpl<$Res>;
  $Res call(
      {BottomBarIndex bottomBarIndex, AudioPlayer? player, bool bgmState});
}

/// @nodoc
class _$PageStateCopyWithImpl<$Res> implements $PageStateCopyWith<$Res> {
  _$PageStateCopyWithImpl(this._value, this._then);

  final PageState _value;
  // ignore: unused_field
  final $Res Function(PageState) _then;

  @override
  $Res call({
    Object? bottomBarIndex = freezed,
    Object? player = freezed,
    Object? bgmState = freezed,
  }) {
    return _then(_value.copyWith(
      bottomBarIndex: bottomBarIndex == freezed
          ? _value.bottomBarIndex
          : bottomBarIndex // ignore: cast_nullable_to_non_nullable
              as BottomBarIndex,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as AudioPlayer?,
      bgmState: bgmState == freezed
          ? _value.bgmState
          : bgmState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PageStateCopyWith<$Res> implements $PageStateCopyWith<$Res> {
  factory _$$_PageStateCopyWith(
          _$_PageState value, $Res Function(_$_PageState) then) =
      __$$_PageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {BottomBarIndex bottomBarIndex, AudioPlayer? player, bool bgmState});
}

/// @nodoc
class __$$_PageStateCopyWithImpl<$Res> extends _$PageStateCopyWithImpl<$Res>
    implements _$$_PageStateCopyWith<$Res> {
  __$$_PageStateCopyWithImpl(
      _$_PageState _value, $Res Function(_$_PageState) _then)
      : super(_value, (v) => _then(v as _$_PageState));

  @override
  _$_PageState get _value => super._value as _$_PageState;

  @override
  $Res call({
    Object? bottomBarIndex = freezed,
    Object? player = freezed,
    Object? bgmState = freezed,
  }) {
    return _then(_$_PageState(
      bottomBarIndex: bottomBarIndex == freezed
          ? _value.bottomBarIndex
          : bottomBarIndex // ignore: cast_nullable_to_non_nullable
              as BottomBarIndex,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as AudioPlayer?,
      bgmState: bgmState == freezed
          ? _value.bgmState
          : bgmState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PageState implements _PageState {
  const _$_PageState(
      {this.bottomBarIndex = BottomBarIndex.one,
      this.player = null,
      this.bgmState = false});

  @override
  @JsonKey()
  final BottomBarIndex bottomBarIndex;
  @override
  @JsonKey()
  final AudioPlayer? player;
  @override
  @JsonKey()
  final bool bgmState;

  @override
  String toString() {
    return 'PageState(bottomBarIndex: $bottomBarIndex, player: $player, bgmState: $bgmState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageState &&
            const DeepCollectionEquality()
                .equals(other.bottomBarIndex, bottomBarIndex) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.bgmState, bgmState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bottomBarIndex),
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(bgmState));

  @JsonKey(ignore: true)
  @override
  _$$_PageStateCopyWith<_$_PageState> get copyWith =>
      __$$_PageStateCopyWithImpl<_$_PageState>(this, _$identity);
}

abstract class _PageState implements PageState {
  const factory _PageState(
      {final BottomBarIndex bottomBarIndex,
      final AudioPlayer? player,
      final bool bgmState}) = _$_PageState;

  @override
  BottomBarIndex get bottomBarIndex => throw _privateConstructorUsedError;
  @override
  AudioPlayer? get player => throw _privateConstructorUsedError;
  @override
  bool get bgmState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PageStateCopyWith<_$_PageState> get copyWith =>
      throw _privateConstructorUsedError;
}
