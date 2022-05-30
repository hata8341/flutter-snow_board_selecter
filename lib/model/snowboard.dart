// 一度代入できれば良いので、定数のクラスして使う（final class)
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snowboard.freezed.dart';
part 'snowboard.g.dart';

@freezed
class Snowboard with _$Snowboard {
  const factory Snowboard({
    required String name,
    required String descprition,
    required String imageUrl,
    required List<double> chartData,
  }) = _Snowboard;

  factory Snowboard.fromJson(Map<String, dynamic> json) =>
      _$SnowboardFromJson(json);
}

// Unable to load asset: images/w_camber.png
// "Unable to load asset: images/w_camber.png"
