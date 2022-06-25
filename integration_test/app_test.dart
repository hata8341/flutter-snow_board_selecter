import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sbselector/main.dart' as app;
import 'package:sbselector/views/diagnose/diagnose_content.dart';
import 'package:sbselector/views/diagnose/diagnose_result.dart';
import 'package:sbselector/views/diagnose/diagnose_top.dart';
import 'package:sbselector/views/settings/setting_top.dart';
import 'package:sbselector/views/top_page.dart';
import 'package:sbselector/widgets/result.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('diagnose flow test', () {
    Future<void> _buildAppMain(WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
    }

    Future<void> _topPageToDiagnoseContentPage(WidgetTester tester) async {
      await tester
          .tap(find.byKey(DiagnoseTopPage.navigateToDiagnoseContentButtonKey));
      await tester.pumpAndSettle();
    }

    Future<void> _dignoseContentToResultPage(WidgetTester tester) async {
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      await tester.tap(find.byIcon(Icons.check_circle));
      await tester.pumpAndSettle();
    }

    Future<void> _resultPageToTopPage(WidgetTester tester) async {
      expect(
          find.byKey(ResultDetail.navigateToTopPageButtonKey), findsOneWidget);
      await tester.tap(find.byKey(ResultDetail.navigateToTopPageButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(TopPage), findsOneWidget);
    }

    Future<void> _topPageToHistoryPage(WidgetTester tester) async {
      await tester.tap(find.byKey(TopPage.historyButtonKey));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    }

    Future<void> _tapFirstRecommendBoard(WidgetTester tester) async {
      expect(find.text('おすすめ1'), findsOneWidget);
      await tester.tap(find.text('おすすめ1'));
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(find.text('おすすめ1'));
      await tester.pumpAndSettle();
    }

    Future<void> _tapSecondRecommendBoard(WidgetTester tester) async {
      expect(find.text('おすすめ2'), findsOneWidget);
      await tester.tap(find.text('おすすめ2'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(find.text('おすすめ2'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    }

    Future<void> _deleteResultPageToHistoryPage(WidgetTester tester) async {
      expect(find.byKey(ResultDetail.historyDeleteButtonKey), findsOneWidget);
      await tester.tap(find.byKey(ResultDetail.historyDeleteButtonKey));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      await tester.tap(find.byIcon(Icons.check_circle));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
    }

    Future<void> _topPageToDiagnosePage(WidgetTester tester) async {
      expect(find.byKey(TopPage.diagnoseButtonKey), findsOneWidget);
      await tester.tap(find.byKey(TopPage.diagnoseButtonKey));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    }

    Future<void> _topPageToSettingsPage(WidgetTester tester) async {
      expect(find.byKey(TopPage.settingsButtonKey), findsOneWidget);
      await tester.tap(find.byKey(TopPage.settingsButtonKey));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    }

    testWidgets('diagnose flow allround pattern history delete test',
        (WidgetTester tester) async {
      await _buildAppMain(tester);

      await _topPageToDiagnoseContentPage(tester);
      expect(find.byType(DiagnoseContentPage), findsOneWidget);

      for (var i = 1; i < 11; i++) {
        expect(find.text('質問$i'), findsOneWidget);
        await tester.tap(find.byKey(DiagnoseContentPage.yesButtonKey));
        await tester.pumpAndSettle();
      }

      await _dignoseContentToResultPage(tester);

      expect(find.byType(DiagnoseResultPage), findsOneWidget);
      expect(find.byType(ResultDetail), findsOneWidget);
      expect(find.text('オールラウンド'), findsOneWidget);

      await _resultPageToTopPage(tester);

      expect(find.byKey(TopPage.historyButtonKey), findsOneWidget);
      await _topPageToHistoryPage(tester);

      expect(find.text('オールラウンド'), findsOneWidget);
      await tester.tap(find.text('オールラウンド'));
      await tester.pumpAndSettle();

      await _tapFirstRecommendBoard(tester);

      await _tapSecondRecommendBoard(tester);

      await _deleteResultPageToHistoryPage(tester);
    });

    testWidgets('diagnose flow groundtrickJib pattern',
        (WidgetTester tester) async {
      await _buildAppMain(tester);

      await _topPageToDiagnoseContentPage(tester);
      expect(find.byType(DiagnoseContentPage), findsOneWidget);

      for (var i = 1; i <= 5; i++) {
        expect(find.text('質問$i'), findsOneWidget);
        await tester.tap(find.byKey(DiagnoseContentPage.yesButtonKey));
        await tester.pumpAndSettle();
      }

      for (var i = 6; i <= 10; i++) {
        expect(find.text('質問$i'), findsOneWidget);
        await tester.tap(find.byKey(DiagnoseContentPage.noButtonKey));
        await tester.pumpAndSettle();
      }

      await _dignoseContentToResultPage(tester);

      expect(find.byType(DiagnoseResultPage), findsOneWidget);
      expect(find.byType(ResultDetail), findsOneWidget);
      expect(find.text('ジブ・グラトリ'), findsOneWidget);

      await tester.tap(find.text('ジブ・グラトリ'));
      await tester.pumpAndSettle();

      await _tapFirstRecommendBoard(tester);

      await _tapSecondRecommendBoard(tester);

      await _resultPageToTopPage(tester);
      Future.delayed(const Duration(seconds: 2));
    });

    testWidgets('diagnose flow freerunPowder pattern',
        (WidgetTester tester) async {
      await _buildAppMain(tester);

      await _topPageToDiagnoseContentPage(tester);
      expect(find.byType(DiagnoseContentPage), findsOneWidget);

      for (var i = 1; i <= 5; i++) {
        expect(find.text('質問$i'), findsOneWidget);
        await tester.tap(find.byKey(DiagnoseContentPage.noButtonKey));
        await tester.pumpAndSettle();
      }

      for (var i = 6; i <= 10; i++) {
        expect(find.text('質問$i'), findsOneWidget);
        await tester.tap(find.byKey(DiagnoseContentPage.yesButtonKey));
        await tester.pumpAndSettle();
      }

      await _dignoseContentToResultPage(tester);

      expect(find.byType(DiagnoseResultPage), findsOneWidget);
      expect(find.byType(ResultDetail), findsOneWidget);
      expect(find.text('フリーラン\nパウダー'), findsOneWidget);

      await tester.tap(find.text('フリーラン\nパウダー'));
      await tester.pumpAndSettle();

      await _tapFirstRecommendBoard(tester);

      await _tapSecondRecommendBoard(tester);

      await _resultPageToTopPage(tester);
      Future.delayed(const Duration(seconds: 2));
    });

    testWidgets('darkMode test', (WidgetTester tester) async {
      await _buildAppMain(tester);

      await Future.delayed(const Duration(seconds: 2));
      await _topPageToSettingsPage(tester);

      expect(find.byKey(SettingList.darkModeButtonKey), findsOneWidget);
      await tester.tap(find.byKey(SettingList.darkModeButtonKey));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await _topPageToDiagnosePage(tester);

      await _topPageToSettingsPage(tester);

      expect(find.byKey(SettingList.darkModeButtonKey), findsOneWidget);
      await tester.tap(find.byKey(SettingList.darkModeButtonKey));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    });

    testWidgets('bgm test', (WidgetTester tester) async {
      await _buildAppMain(tester);

      await Future.delayed(const Duration(seconds: 2));
      await _topPageToSettingsPage(tester);

      expect(find.byKey(SettingList.bgmButtonKey), findsOneWidget);
      await tester.tap(find.byKey(SettingList.bgmButtonKey));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      await tester.tap(find.byKey(SettingList.bgmButtonKey));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
