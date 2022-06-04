import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/answer_view_model.dart';
import 'package:sbselector/view_model/diagnose_view_model.dart';

AwesomeDialog endDialog(BuildContext inputContext, WidgetRef ref) {
  //  dialogPackageの影響なのか、answerListが−１されるため
  // ここで定義する
  final answerListController = ref.read(answerListProvider.notifier);
  return AwesomeDialog(
    context: inputContext,
    animType: AnimType.SCALE,
    headerAnimationLoop: false,
    dialogType: DialogType.SUCCES,
    showCloseIcon: true,
    // dismissOnTouchOutside: false,
    title: 'お疲れさまでした！',
    // desc:
    //     'Dialog description here..................................................',
    btnOkText: "結果画面へ",
    btnOkOnPress: () async {
      debugPrint('OnClcik');
      // final rideType = computeResult(ref, answerList);
      final rideType = answerListController.computedResult();
      // await Future.delayed(
      //   const Duration(seconds: 2),
      // );
      // print('2秒後');
      Navigator.pushNamed(inputContext, '/diagnoseResult', arguments: rideType);
    },
    btnOkIcon: Icons.check_circle,
    btnCancelOnPress: () {
      mistake(ref);
    },
    onDissmissCallback: (type) {
      debugPrint('Dialog Dissmiss from callback $type');
      mistake(ref);
    },
  );
}

Future<dynamic> showSelfDialog(AwesomeDialog dialog) {
  return dialog.show();
}
