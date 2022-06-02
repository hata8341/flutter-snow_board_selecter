import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';


ElevatedButton shareButton(ScreenshotController screenShotController) {
  return ElevatedButton.icon(
    icon: const Icon(
      Icons.share,
      color: Colors.white,
    ),
    onPressed: () {
      try {
        _shareResult(screenShotController);
      } catch (e) {
        print(e);
      }
    },
    label: const Text('共有'),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

void _shareResult(ScreenshotController screenShotController) async {
  const _shareText = '#スノボセレクター';
  final _screenshot = await screenShotController.capture(
    delay: const Duration(milliseconds: 10),
  );
  if (_screenshot != null) {
    final _documentDirectoryPath = await getApplicationDocumentsDirectory();
    final imagePath =
        await File('${_documentDirectoryPath.path}/screenshot.png').create();
    await imagePath.writeAsBytes(_screenshot);
    await Share.shareFiles([imagePath.path], text: _shareText);
    await imagePath.delete();
  }
}
