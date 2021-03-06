import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/history_view_model.dart';

AwesomeDialog deleteDialog(
    BuildContext inputContext, WidgetRef ref, String id) {
  final historyController = ref.watch(historyNotifierProvider.notifier);
  return AwesomeDialog(
    context: inputContext,
    dialogType: DialogType.ERROR,
    animType: AnimType.TOPSLIDE,
    headerAnimationLoop: false,
    desc: '診断結果を削除してよろしいですか？',

    btnCancelOnPress: () {},
    btnOkIcon: Icons.check_circle,
    btnOkOnPress: () async {
      historyController.delete(id);
      ScaffoldMessenger.of(inputContext).showSnackBar(
        const SnackBar(
          content: Text('診断結果を削除しました'),
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.of(inputContext).pop();
    },
    onDissmissCallback: (type) {},
  );
}
