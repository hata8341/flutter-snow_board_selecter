import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/ridetype.dart';
import 'package:sbselector/widgets/result.dart';

class DiagnoseResultPage extends HookConsumerWidget {
  const DiagnoseResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final RideType rideType = args as RideType;
    return ResultDetail(rideType: rideType,id: null,);
  }
}
