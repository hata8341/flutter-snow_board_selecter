import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/widgets/result.dart';

class DiagnoseResultPage extends HookConsumerWidget {
  const DiagnoseResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final String rideType = args as String;
    return ResultDetail(key, rideType);
  }
}
