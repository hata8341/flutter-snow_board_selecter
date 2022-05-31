// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String get rideType => throw _privateConstructorUsedError;
  Snowboard get firstRecommendBoard => throw _privateConstructorUsedError;
  Snowboard get secondRecommendBoard => throw _privateConstructorUsedError;
  String get discription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res>;
  $Res call(
      {String rideType,
      Snowboard firstRecommendBoard,
      Snowboard secondRecommendBoard,
      String discription});

  $SnowboardCopyWith<$Res> get firstRecommendBoard;
  $SnowboardCopyWith<$Res> get secondRecommendBoard;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res> implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result _value;
  // ignore: unused_field
  final $Res Function(Result) _then;

  @override
  $Res call({
    Object? rideType = freezed,
    Object? firstRecommendBoard = freezed,
    Object? secondRecommendBoard = freezed,
    Object? discription = freezed,
  }) {
    return _then(_value.copyWith(
      rideType: rideType == freezed
          ? _value.rideType
          : rideType // ignore: cast_nullable_to_non_nullable
              as String,
      firstRecommendBoard: firstRecommendBoard == freezed
          ? _value.firstRecommendBoard
          : firstRecommendBoard // ignore: cast_nullable_to_non_nullable
              as Snowboard,
      secondRecommendBoard: secondRecommendBoard == freezed
          ? _value.secondRecommendBoard
          : secondRecommendBoard // ignore: cast_nullable_to_non_nullable
              as Snowboard,
      discription: discription == freezed
          ? _value.discription
          : discription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $SnowboardCopyWith<$Res> get firstRecommendBoard {
    return $SnowboardCopyWith<$Res>(_value.firstRecommendBoard, (value) {
      return _then(_value.copyWith(firstRecommendBoard: value));
    });
  }

  @override
  $SnowboardCopyWith<$Res> get secondRecommendBoard {
    return $SnowboardCopyWith<$Res>(_value.secondRecommendBoard, (value) {
      return _then(_value.copyWith(secondRecommendBoard: value));
    });
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {String rideType,
      Snowboard firstRecommendBoard,
      Snowboard secondRecommendBoard,
      String discription});

  @override
  $SnowboardCopyWith<$Res> get firstRecommendBoard;
  @override
  $SnowboardCopyWith<$Res> get secondRecommendBoard;
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res> extends _$ResultCopyWithImpl<$Res>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, (v) => _then(v as _$_Result));

  @override
  _$_Result get _value => super._value as _$_Result;

  @override
  $Res call({
    Object? rideType = freezed,
    Object? firstRecommendBoard = freezed,
    Object? secondRecommendBoard = freezed,
    Object? discription = freezed,
  }) {
    return _then(_$_Result(
      rideType: rideType == freezed
          ? _value.rideType
          : rideType // ignore: cast_nullable_to_non_nullable
              as String,
      firstRecommendBoard: firstRecommendBoard == freezed
          ? _value.firstRecommendBoard
          : firstRecommendBoard // ignore: cast_nullable_to_non_nullable
              as Snowboard,
      secondRecommendBoard: secondRecommendBoard == freezed
          ? _value.secondRecommendBoard
          : secondRecommendBoard // ignore: cast_nullable_to_non_nullable
              as Snowboard,
      discription: discription == freezed
          ? _value.discription
          : discription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result with DiagnosticableTreeMixin implements _Result {
  const _$_Result(
      {required this.rideType,
      required this.firstRecommendBoard,
      required this.secondRecommendBoard,
      required this.discription});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final String rideType;
  @override
  final Snowboard firstRecommendBoard;
  @override
  final Snowboard secondRecommendBoard;
  @override
  final String discription;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result(rideType: $rideType, firstRecommendBoard: $firstRecommendBoard, secondRecommendBoard: $secondRecommendBoard, discription: $discription)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result'))
      ..add(DiagnosticsProperty('rideType', rideType))
      ..add(DiagnosticsProperty('firstRecommendBoard', firstRecommendBoard))
      ..add(DiagnosticsProperty('secondRecommendBoard', secondRecommendBoard))
      ..add(DiagnosticsProperty('discription', discription));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            const DeepCollectionEquality().equals(other.rideType, rideType) &&
            const DeepCollectionEquality()
                .equals(other.firstRecommendBoard, firstRecommendBoard) &&
            const DeepCollectionEquality()
                .equals(other.secondRecommendBoard, secondRecommendBoard) &&
            const DeepCollectionEquality()
                .equals(other.discription, discription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rideType),
      const DeepCollectionEquality().hash(firstRecommendBoard),
      const DeepCollectionEquality().hash(secondRecommendBoard),
      const DeepCollectionEquality().hash(discription));

  @JsonKey(ignore: true)
  @override
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultToJson(this);
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {required final String rideType,
      required final Snowboard firstRecommendBoard,
      required final Snowboard secondRecommendBoard,
      required final String discription}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  String get rideType => throw _privateConstructorUsedError;
  @override
  Snowboard get firstRecommendBoard => throw _privateConstructorUsedError;
  @override
  Snowboard get secondRecommendBoard => throw _privateConstructorUsedError;
  @override
  String get discription => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
