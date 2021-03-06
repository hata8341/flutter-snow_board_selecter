import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/ride_type.dart';
import 'package:sbselector/view_model/diagnose_view_model.dart';

AwesomeDialog endDialog(BuildContext inputContext, WidgetRef ref) {
  final diagnoseController = ref.read(diagnoseProvider.notifier);
  return AwesomeDialog(
    context: inputContext,
    animType: AnimType.SCALE,
    headerAnimationLoop: false,
    dialogType: DialogType.SUCCES,
    showCloseIcon: true,
    title: 'お疲れさまでした！',
    btnOkText: "結果画面",
    btnOkOnPress: () async {
      debugPrint('OnClcik');
      final RideType rideType = diagnoseController.computedResult();
      Navigator.pushNamed(inputContext, '/diagnoseResult', arguments: rideType);
    },
    btnCancelText: '戻る',
    btnCancelOnPress: () {
      diagnoseController.missTake();
    },
    onDissmissCallback: (type) {
      debugPrint('Dialog Dissmiss from callback $type');
      return (type == DismissType.MODAL_BARRIER || type == DismissType.TOP_ICON)
          ? diagnoseController.missTake()
          : debugPrint('okbutton');
    },
  );
}

Future<dynamic> showSelfDialog(AwesomeDialog dialog) {
  return dialog.show();
}
