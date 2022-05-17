import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/firebase/firebase_analytics_config.dart';
import 'package:sbselector/views/diagnose/diagnose_content.dart';

import 'firebase/firebase_crashlytics_config.dart';
import 'views/diagnose/diagnose_top.dart';

class MyApp extends HookConsumerWidget {
  const MyApp(this.id, {Key? key}) : super(key: key);

  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(crashReporter).setIdentify(id);
      return null;
    }, []);

    return MaterialApp(
      builder: (BuildContext context, widget) {
        Widget error = const Text('表示エラー');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(
              body: Center(
            child: error,
          ));
        }
        ErrorWidget.builder = (FlutterErrorDetails details) {
          ref
              .read(crashReporter)
              .report(details.exceptionAsString(), details.stack);
          return error;
        };
        return widget!;
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[AnalyticsServeice.observer],
      initialRoute: '/diagnoseTop',
      routes: {
        '/diagnoseTop': (context) => DiagnoseTopPage(),
        '/diagnoseContent': (context) => const DiagnoseContentPage(),
        
      },
    );
  }
}
