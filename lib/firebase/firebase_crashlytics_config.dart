import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final crashReporter =
    Provider<ImplCrashReporter>((ref) => CrashReporter.instance);

abstract class ImplCrashReporter {
  Future<void> initialize();
  Future<void> setIdentify(String id);
  Future<void> report(dynamic exception, StackTrace? stack);
}

class CrashReporter implements ImplCrashReporter {
  CrashReporter._(this._reporter);

  final FirebaseCrashlytics _reporter;

  static ImplCrashReporter? _instance;
  static ImplCrashReporter get instance {
    _instance ??= CrashReporter._(FirebaseCrashlytics.instance);

    return _instance as ImplCrashReporter;
  }

  @override
  Future<void> initialize() async {
    await _reporter.setCrashlyticsCollectionEnabled(kReleaseMode);
  }

  @override
  Future<void> setIdentify(String id) async {
    await _reporter.setUserIdentifier(id);
  }

  @override
  Future<void> report(exception, StackTrace? stack) async {
    await _reporter.recordError(exception, stack);
  }
}
