// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'snowboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Snowboard _$SnowboardFromJson(Map<String, dynamic> json) {
  return _Snowboard.fromJson(json);
}

/// @nodoc
mixin _$Snowboard {
  String get name => throw _privateConstructorUsedError;
  String get descprition => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<double> get chartData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnowboardCopyWith<Snowboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnowboardCopyWith<$Res> {
  factory $SnowboardCopyWith(Snowboard value, $Res Function(Snowboard) then) =
      _$SnowboardCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String descprition,
      String imageUrl,
      List<double> chartData});
}

/// @nodoc
class _$SnowboardCopyWithImpl<$Res> implements $SnowboardCopyWith<$Res> {
  _$SnowboardCopyWithImpl(this._value, this._then);

  final Snowboard _value;
  // ignore: unused_field
  final $Res Function(Snowboard) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? descprition = freezed,
    Object? imageUrl = freezed,
    Object? chartData = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      descprition: descprition == freezed
          ? _value.descprition
          : descprition // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      chartData: chartData == freezed
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
abstract class _$$_SnowboardCopyWith<$Res> implements $SnowboardCopyWith<$Res> {
  factory _$$_SnowboardCopyWith(
          _$_Snowboard value, $Res Function(_$_Snowboard) then) =
      __$$_SnowboardCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String descprition,
      String imageUrl,
      List<double> chartData});
}

/// @nodoc
class __$$_SnowboardCopyWithImpl<$Res> extends _$SnowboardCopyWithImpl<$Res>
    implements _$$_SnowboardCopyWith<$Res> {
  __$$_SnowboardCopyWithImpl(
      _$_Snowboard _value, $Res Function(_$_Snowboard) _then)
      : super(_value, (v) => _then(v as _$_Snowboard));

  @override
  _$_Snowboard get _value => super._value as _$_Snowboard;

  @override
  $Res call({
    Object? name = freezed,
    Object? descprition = freezed,
    Object? imageUrl = freezed,
    Object? chartData = freezed,
  }) {
    return _then(_$_Snowboard(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      descprition: descprition == freezed
          ? _value.descprition
          : descprition // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      chartData: chartData == freezed
          ? _value._chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Snowboard implements _Snowboard {
  const _$_Snowboard(
      {required this.name,
      required this.descprition,
      required this.imageUrl,
      required final List<double> chartData})
      : _chartData = chartData;

  factory _$_Snowboard.fromJson(Map<String, dynamic> json) =>
      _$$_SnowboardFromJson(json);

  @override
  final String name;
  @override
  final String descprition;
  @override
  final String imageUrl;
  final List<double> _chartData;
  @override
  List<double> get chartData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartData);
  }

  @override
  String toString() {
    return 'Snowboard(name: $name, descprition: $descprition, imageUrl: $imageUrl, chartData: $chartData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Snowboard &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.descprition, descprition) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._chartData, _chartData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(descprition),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(_chartData));

  @JsonKey(ignore: true)
  @override
  _$$_SnowboardCopyWith<_$_Snowboard> get copyWith =>
      __$$_SnowboardCopyWithImpl<_$_Snowboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SnowboardToJson(this);
  }
}

abstract class _Snowboard implements Snowboard {
  const factory _Snowboard(
      {required final String name,
      required final String descprition,
      required final String imageUrl,
      required final List<double> chartData}) = _$_Snowboard;

  factory _Snowboard.fromJson(Map<String, dynamic> json) =
      _$_Snowboard.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get descprition => throw _privateConstructorUsedError;
  @override
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  List<double> get chartData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SnowboardCopyWith<_$_Snowboard> get copyWith =>
      throw _privateConstructorUsedError;
}
