import 'package:sbselector/model/my_ridetype.dart';

String? castStr(dynamic args) {
  if (args is String) {
    return args;
  } else if (args is MyRideType) {
    return args.rideType;
  }
  return null;
}
