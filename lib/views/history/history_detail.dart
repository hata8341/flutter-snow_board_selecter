import 'package:flutter/material.dart';
import 'package:sbselector/model/my_ridetype.dart';
import 'package:sbselector/widgets/result.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyRideType rideType =
        ModalRoute.of(context)!.settings.arguments as MyRideType;
    return ResultDetail(key, rideType.rideType, rideType);
  }
}
