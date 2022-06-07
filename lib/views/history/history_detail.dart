import 'package:flutter/material.dart';
import 'package:sbselector/model/result.dart';
import 'package:sbselector/widgets/result.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Result myRideType =
        ModalRoute.of(context)!.settings.arguments as Result;
    return ResultDetail(key, myRideType.rideType, myRideType);
  }
}
