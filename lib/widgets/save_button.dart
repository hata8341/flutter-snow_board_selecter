import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/my_ridetypes_view_model.dart';

ElevatedButton saveButton(
    String rideType, BuildContext context, WidgetRef ref) {
  final myRideTypesController = ref.watch(myRideTypesProvider.notifier);

  return ElevatedButton.icon(
    icon: const Icon(
      Icons.save,
      color: Colors.white,
    ),
    onPressed: () async {
      myRideTypesController.add(rideType);
      ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
    },
    label: const Text('保存'),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

SnackBar successSnackBar = SnackBar(
  content: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text('保存しました'),
    ],
  ),
  duration: const Duration(
    seconds: 2,
  ),
);
