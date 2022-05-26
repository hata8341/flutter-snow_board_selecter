import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/answer.dart';
import 'package:sbselector/view_model/answer_view_model.dart';
import 'package:sbselector/view_model/diagnose_view_model.dart';

AwesomeDialog endDialog(BuildContext inputContext, WidgetRef ref) {
  //  dialogPackageの影響なのか、answerListが−１されるため
  // ここで定義する
  print('answerListを定義する');
  final List<Answer> answerList = ref.read(answerListProvider);
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
    btnOkOnPress: () {
      debugPrint('OnClcik');
      computeResult(ref,answerList);
      Navigator.pushNamed(inputContext, '/diagnoseResult');
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
