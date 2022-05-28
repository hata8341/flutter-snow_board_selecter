// 一度代入できれば良いので、定数のクラスして使う（final class)
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sbselector/model/snowboard.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  const factory Result({
    required String rideType,
    required Snowboard firstRecommendBoard,
    required Snowboard secondRecommendBoard,
    required String discription,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
