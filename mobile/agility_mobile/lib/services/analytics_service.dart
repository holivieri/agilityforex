import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(id: userId);
  }

  Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }

  void registerThemeMode(BuildContext context, {bool logAsEvent = false}) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final mode = isDark ? 'dark' : 'light';

    setUserProperty('theme_mode', mode);

    if (logAsEvent) {
      logEvent('theme_changed', parameters: {'mode': mode});
    }
  }

  // Eventos personalizados para AgilityForex

  Future<void> logLogin({required String method}) async {
    await _analytics.logLogin(loginMethod: method);
  }

  Future<void> logSignUp({required String method}) async {
    await _analytics.logSignUp(signUpMethod: method);
  }

  Future<void> logCurrencyExchange({
    required String fromCurrency,
    required String toCurrency,
    required double amount,
    required double rate,
    required double fee,
  }) async {
    await _analytics.logEvent(
      name: 'currency_exchange',
      parameters: {
        'from_currency': fromCurrency,
        'to_currency': toCurrency,
        'amount': amount,
        'exchange_rate': rate,
        'fee': fee,
      },
    );
  }

  Future<void> logRateViewed({
    required String fromCurrency,
    required String toCurrency,
    required double rate,
  }) async {
    await _analytics.logEvent(
      name: 'rate_viewed',
      parameters: {
        'from_currency': fromCurrency,
        'to_currency': toCurrency,
        'rate': rate,
      },
    );
  }

  Future<void> logSettingsChanged({
    required String settingName,
    required String newValue,
  }) async {
    await _analytics.logEvent(
      name: 'settings_changed',
      parameters: {'setting_name': settingName, 'new_value': newValue},
    );
  }
}
