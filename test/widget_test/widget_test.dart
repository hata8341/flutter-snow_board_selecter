import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/app.dart';
import 'package:sbselector/views/diagnose/diagnose_content.dart';
import 'package:sbselector/views/diagnose/diagnose_result.dart';
import 'package:sbselector/views/diagnose/diagnose_top.dart';
import 'package:sbselector/widgets/result.dart';

import 'mock.dart';

void main() {
  group('result display test', () async {
    Future<void> _buildTopPage(WidgetTester tester) async {
      setupFirebaseAuthMocks();
      await Firebase.initializeApp();
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(DiagnoseTopPage), findsOneWidget);
    }

    Future<void> _navigateToDiagnoseContentPage(WidgetTester tester) async {
      await tester
          .tap(find.byKey(DiagnoseTopPage.navigateToDiagnoseContentButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(DiagnoseContentPage), findsOneWidget);
    }

    testWidgets(
      "result allround display test",
      (WidgetTester tester) async {
        await _buildTopPage(tester);
        await _navigateToDiagnoseContentPage(tester);
        for (var i = 0; i < 10; i++) {
          await tester.tap(find.byKey(DiagnoseContentPage.yesButtonKey));
          await tester.pumpAndSettle();
        }
        await tester.tap(find.byIcon(Icons.check_circle));
        await tester.pumpAndSettle();

        expect(find.byType(DiagnoseResultPage), findsOneWidget);
        expect(find.byType(ResultDetail), findsOneWidget);
        expect(find.text('オールラウンド'), findsOneWidget);
      },
    );
  });
}
