import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/firebase/firebase_analytics_config.dart';
import 'package:sbselector/firebase/firebase_crashlytics_config.dart';
import 'package:sbselector/firebase/firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
//   runApp(const MyApp());
// }

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await CrashReporter.instance.initialize();

    FlutterError.onError = (FlutterErrorDetails details) {
      CrashReporter.instance.report(details.exceptionAsString(), details.stack);
    };

    runApp(const ProviderScope(child: MyApp('user_identify')));
  }, (error, stack) {
    CrashReporter.instance.report(error, stack);
  });
}

// class MyApp extends StatelessWidget {
//   const MyApp(this.id,{Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
// debugShowCheckedModeBanner: false,
// title: 'Flutter Demo',
// theme: ThemeData(
//   primarySwatch: Colors.blue,
// ),
// navigatorObservers: <NavigatorObserver>[AnalyticsServeice.observer],
// home: const MyHomePage(title: 'Flutter Demo test3 Home Page'),
//     );
//   }
// }

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
      home: const MyHomePage(title: 'Flutter Demo test3 Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    FirebaseCrashlytics.instance.crash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
