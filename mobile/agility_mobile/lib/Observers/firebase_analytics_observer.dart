import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class FirebaseAnalyticsObserver extends NavigatorObserver {
  final FirebaseAnalytics analytics;

  FirebaseAnalyticsObserver({required this.analytics});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _sendScreenView(route);
    super.didPush(route, previousRoute);
  }

  void _sendScreenView(Route<dynamic> route) {
    final screenName = route.settings.name ?? route.runtimeType.toString();
    analytics.logScreenView(screenName: screenName, screenClass: screenName);
  }
}
