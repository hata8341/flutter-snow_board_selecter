import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

ElevatedButton shareButton(
    BuildContext context, ScreenshotController screenShotController) {
  Future<Uint8List?> capture() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return await screenShotController.capture(
      delay: const Duration(milliseconds: 10),
    );
  }

  final Future<Uint8List?> screenshotData = capture();

  void _shareResult() async {
    const shareText =
        '#スノボセレクター\n #スノーボード #snowboard\nhttps://twitter.com/snow_board_app/';
    final box = context.findRenderObject() as RenderBox?;
    await screenshotData.then((Uint8List? image) async {
      if (image != null) {
        final documentDirectoryPath = await getApplicationDocumentsDirectory();
        final imagePath =
            await File('${documentDirectoryPath.path}/screenshot.png').create();
        await imagePath.writeAsBytes(image);
        await Share.shareFiles(
          [imagePath.path],
          subject: '共有',
          text: shareText,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        );
      }
    });
  }

  return ElevatedButton.icon(
    icon: const Icon(
      Icons.share,
    ),
    onPressed: () {
      try {
        _shareResult();
      } catch (e) {
        debugPrint(e.toString());
      }
    },
    label: const Text(
      '共有',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
