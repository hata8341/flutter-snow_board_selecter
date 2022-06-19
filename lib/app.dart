import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/theme.dart';
import 'package:sbselector/firebase/firebase_analytics_config.dart';
import 'package:sbselector/view_model/page_view_model.dart';
import 'package:sbselector/view_model/theme_view_mode.dart';
import 'package:sbselector/views/diagnose/diagnose_content.dart';
import 'package:sbselector/views/diagnose/diagnose_result.dart';
import 'package:sbselector/views/history/history_detail.dart';
import 'package:sbselector/views/history/history_top.dart';
import 'package:sbselector/views/settings/error_page.dart';
import 'package:sbselector/views/settings/setting_top.dart';
import 'package:sbselector/views/top_page.dart';

import 'views/diagnose/diagnose_top.dart';

class MyApp extends HookConsumerWidget {
  const MyApp(this.id, {Key? key}) : super(key: key);

  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeStateProvider).themeMode;
    final bgmController = ref.watch(pageStateProvider.notifier);

    SystemChannels.lifecycle.setMessageHandler((message) {
      if (message == 'AppLifecycleState.paused') {
        bgmController.checkPausedBgm();
      }
      if (message == 'AppLifecycleState.resumed') {
        bgmController.checkResumedBgm();
      }
      return Future<String>.value('');
    });

    return MaterialApp(
      builder: (BuildContext context, widget) {
        Widget error = const Text('表示エラー');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(
              body: Center(
            child: error,
          ));
        }
        return widget as Widget;
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: themeMode,
      theme: lightThemeData(),
      darkTheme: darkThemeData(),
      navigatorObservers: <NavigatorObserver>[AnalyticsServeice.observer],
      initialRoute: '/',
      routes: {
        '/': (context) => const TopPage(),
        '/diagnoseTop': (context) => const DiagnoseTopPage(),
        '/diagnoseContent': (context) => const DiagnoseContentPage(),
        '/diagnoseResult': (context) => const DiagnoseResultPage(),
        '/historyTop': (context) => const HistoryTopPage(),
        '/historyDetail': (context) => const HistoryDetailPage(),
        '/setting': (context) => const SettingList(),
        '/errorPage': (context) => const ErrorPage(),
      },
    );
  }
}
