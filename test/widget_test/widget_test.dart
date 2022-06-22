
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test group', () {
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
  });

  // testWidgets('', callback)

}
