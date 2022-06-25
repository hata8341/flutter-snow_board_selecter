import 'package:flutter/material.dart';
import 'package:sbselector/const/ride_type.dart';
import 'package:sbselector/widgets/result.dart';

class DiagnoseResultPage extends StatelessWidget {
  const DiagnoseResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final RideType rideType = args as RideType;
    return ResultDetail(
      rideType: rideType,
      id: null,
    );
  }
}
