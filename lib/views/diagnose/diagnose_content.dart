import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// title:診断
class DiagnoseContentPage extends HookConsumerWidget {
  DiagnoseContentPage({Key? key}) : super(key: key);

  String title = "診断内容";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$title+画面',
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/diagnoseTop');
              },
              child: const Text('診断トップ画面へ'),
            ),
          ],
        ),
      ),
    );
  }
}
