import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:sbselector/const/ridetype.dart';

part 'result.freezed.dart';

@freezed
class Result with _$Result {
  const Result._();

  const factory Result({
    required String id,
    required RideType rideType,
    required DateTime createdAt,
  }) = _Result;

  factory Result.fromMap(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      rideType: RideType.values.byName(json['rideType']),
      createdAt: DateTime.parse(json['createdAt']).toLocal(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rideType': rideType.name,
      'createdAt': createdAt.toUtc().toIso8601String()
    };
  }

  String get createdAtStr {
    final time = createdAt;
    final ymed = DateFormat.yMEd('ja').format(time);
    final hm = DateFormat.Hm('ja').format(time);
    return ymed + hm;
  }
}
