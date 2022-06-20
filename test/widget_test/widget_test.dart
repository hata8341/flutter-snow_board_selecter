// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('初めてのwidgetテスト', (WidgetTester tester) async {
    // テストするウィジェットを探すのにキーを使うことができる
    var sliderKey = UniqueKey();
    var value = 0.0;

    // テスターに渡されたウィジェットツリーに基づいてUIを構築するように指示する。
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setstate) {
          return MaterialApp(
            home: Material(
              child: Center(
                child: Slider(
                  key: sliderKey,
                  value: value,
                  onChanged: (double newValue) {
                    setstate(() {
                      value = newValue;
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
    expect(value, equals(0.0));

    // キーで見つかったウィジェットをタップする
    await tester.tap(find.byKey(sliderKey));

    // キーで見つかったウィジェットをタップする
    expect(value, equals(0.5));
  });
}
