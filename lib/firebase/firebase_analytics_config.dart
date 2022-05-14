import 'package:firebase_analytics/firebase_analytics.dart';


class AnalyticsServeice {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
}
