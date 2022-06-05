import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

ElevatedButton shareButton(ScreenshotController screenShotController) {
  Future<Uint8List?> capture() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return await screenShotController.capture(
      delay: const Duration(milliseconds: 10),
    );
  }

  final Future<Uint8List?> screenshotData = capture();

  void _shareResult() async {
    const shareText = '#スノボセレクター';
    await screenshotData.then((Uint8List? image) async {
      if (image != null) {
        final _documentDirectoryPath = await getApplicationDocumentsDirectory();
        final imagePath =
            await File('${_documentDirectoryPath.path}/screenshot.png')
                .create();
        await imagePath.writeAsBytes(image);

        await Share.shareFiles([imagePath.path], text: shareText);
        await imagePath.delete();
      }
    });
  }

  return ElevatedButton.icon(
    icon: const Icon(
      Icons.share,
      color: Colors.white,
    ),
    onPressed: () {
      try {
        _shareResult();
      } catch (e) {
        print(e);
      }
    },
    label: const Text(
      '共有',
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
