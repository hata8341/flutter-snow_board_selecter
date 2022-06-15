// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_contact_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormContactState {
  int get positon => throw _privateConstructorUsedError;
  bool? get conennctionStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormContactStateCopyWith<FormContactState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormContactStateCopyWith<$Res> {
  factory $FormContactStateCopyWith(
          FormContactState value, $Res Function(FormContactState) then) =
      _$FormContactStateCopyWithImpl<$Res>;
  $Res call({int positon, bool? conennctionStatus});
}

/// @nodoc
class _$FormContactStateCopyWithImpl<$Res>
    implements $FormContactStateCopyWith<$Res> {
  _$FormContactStateCopyWithImpl(this._value, this._then);

  final FormContactState _value;
  // ignore: unused_field
  final $Res Function(FormContactState) _then;

  @override
  $Res call({
    Object? positon = freezed,
    Object? conennctionStatus = freezed,
  }) {
    return _then(_value.copyWith(
      positon: positon == freezed
          ? _value.positon
          : positon // ignore: cast_nullable_to_non_nullable
              as int,
      conennctionStatus: conennctionStatus == freezed
          ? _value.conennctionStatus
          : conennctionStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_FormContactStateCopyWith<$Res>
    implements $FormContactStateCopyWith<$Res> {
  factory _$$_FormContactStateCopyWith(
          _$_FormContactState value, $Res Function(_$_FormContactState) then) =
      __$$_FormContactStateCopyWithImpl<$Res>;
  @override
  $Res call({int positon, bool? conennctionStatus});
}

/// @nodoc
class __$$_FormContactStateCopyWithImpl<$Res>
    extends _$FormContactStateCopyWithImpl<$Res>
    implements _$$_FormContactStateCopyWith<$Res> {
  __$$_FormContactStateCopyWithImpl(
      _$_FormContactState _value, $Res Function(_$_FormContactState) _then)
      : super(_value, (v) => _then(v as _$_FormContactState));

  @override
  _$_FormContactState get _value => super._value as _$_FormContactState;

  @override
  $Res call({
    Object? positon = freezed,
    Object? conennctionStatus = freezed,
  }) {
    return _then(_$_FormContactState(
      positon: positon == freezed
          ? _value.positon
          : positon // ignore: cast_nullable_to_non_nullable
              as int,
      conennctionStatus: conennctionStatus == freezed
          ? _value.conennctionStatus
          : conennctionStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FormContactState implements _FormContactState {
  const _$_FormContactState({this.positon = 1, this.conennctionStatus = null});

  @override
  @JsonKey()
  final int positon;
  @override
  @JsonKey()
  final bool? conennctionStatus;

  @override
  String toString() {
    return 'FormContactState(positon: $positon, conennctionStatus: $conennctionStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormContactState &&
            const DeepCollectionEquality().equals(other.positon, positon) &&
            const DeepCollectionEquality()
                .equals(other.conennctionStatus, conennctionStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(positon),
      const DeepCollectionEquality().hash(conennctionStatus));

  @JsonKey(ignore: true)
  @override
  _$$_FormContactStateCopyWith<_$_FormContactState> get copyWith =>
      __$$_FormContactStateCopyWithImpl<_$_FormContactState>(this, _$identity);
}

abstract class _FormContactState implements FormContactState {
  const factory _FormContactState(
      {final int positon, final bool? conennctionStatus}) = _$_FormContactState;

  @override
  int get positon => throw _privateConstructorUsedError;
  @override
  bool? get conennctionStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FormContactStateCopyWith<_$_FormContactState> get copyWith =>
      throw _privateConstructorUsedError;
}
