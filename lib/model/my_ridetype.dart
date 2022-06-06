import 'package:sbselector/const/rideType.dart';

// Resultclassへ変更
// freeezedでイミュータブルへ変更
class MyRideType {
  final String id;
  final RideType rideType;
  final DateTime createdAt;

  MyRideType({
    required this.id,
    required this.rideType,
    required this.createdAt,
  });

  factory MyRideType.fromMap(Map<String, dynamic> json) {
    return MyRideType(
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
}
