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
