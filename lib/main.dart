import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sbselector/firebase/firebase_crashlytics_config.dart';
import 'package:sbselector/firebase/firebase_options.dart';

import 'app.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await CrashReporter.instance.initialize();

    FlutterError.onError = (FlutterErrorDetails details) {
      CrashReporter.instance.report(details.exceptionAsString(), details.stack);
    };
    await initializeDateFormatting('ja');

    runApp(const ProviderScope(child: MyApp('user_identify')));
  }, (error, stack) {
    CrashReporter.instance.report(error, stack);
  });
}
