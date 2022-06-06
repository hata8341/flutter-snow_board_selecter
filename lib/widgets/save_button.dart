import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/rideType.dart';
import 'package:sbselector/view_model/my_ridetypes_view_model.dart';

ElevatedButton saveButton(
    RideType rideType, BuildContext context, WidgetRef ref) {
  final myRideTypesController = ref.watch(myRideTypesProvider.notifier);

  return ElevatedButton.icon(
    icon: const Icon(
      Icons.save,
      color: Colors.white,
    ),
    onPressed: () {
      myRideTypesController.add(rideType);
      ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
    },
    label: const Text(
      '保存',
      style: TextStyle(fontSize: 24),
    ),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
    seconds: 1,
  ),
);
