import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/my_ridetype.dart';
import 'package:sbselector/view_model/my_ridetypes_view_model.dart';

AwesomeDialog deleteDialog(
    BuildContext inputContext, WidgetRef ref, String id) {
  //  dialogPackageの影響なのか、answerListが−１されるため
  // ここで定義する
  final myRideTypesController = ref.watch(myRideTypesProvider.notifier);
  final MyRideType rideType =
      ModalRoute.of(inputContext)!.settings.arguments as MyRideType;
  return AwesomeDialog(
    context: inputContext,
    dialogType: DialogType.ERROR,
    animType: AnimType.TOPSLIDE,
    desc: '診断結果を削除してよろしいですか？',
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      myRideTypesController.delete(id);
      ScaffoldMessenger.of(inputContext).showSnackBar(
        const SnackBar(
          content: Text('診断結果を削除しました'),
        ),
      );
      Navigator.of(inputContext).pop();
    },
    onDissmissCallback: (type) {},
  );
}
