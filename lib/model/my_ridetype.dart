class MyRideType {
  final String id;
  final String rideType;
  final DateTime createdAt;

  MyRideType({
    required this.id,
    required this.rideType,
    required this.createdAt,
  });

  factory MyRideType.fromMap(Map<String, dynamic> json) {
    return MyRideType(
      id: json['id'],
      rideType: json['rideType'],
      createdAt: DateTime.parse(json['createdAt']).toLocal(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rideType': rideType,
      'createdAt': createdAt.toUtc().toIso8601String()
    };
  }
}
