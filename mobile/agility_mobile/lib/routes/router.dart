import 'package:agility_mobile/main.dart';
import 'package:agility_mobile/models/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/error_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/user_proferences_page.dart';
import 'routes.dart';

mixin RouterMixin on State<MyApp> {
  GoRouter? _router;
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get myRouter {
    _router ??= GoRouter(
      errorBuilder: (_, state) => ErrorPage(goRouterState: state),
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          name: Routes.loginRoute,
          path: '/login',
          builder: (_, __) => const LoginPage(),
        ),
        GoRoute(
          name: Routes.userPreferencesRoute,
          path: '/userPreferences',
          builder: (_, __) => const UserPreferencesPage(),
        ),
        GoRoute(
          name: Routes.initialRoute,
          path: '/',
          builder: (_, __) => const HomePage(),
          redirect: (context, state) async {
            final token = UserPreferences().deviceToken;
            final tokenExpirationDate = UserPreferences().tokenExpirationDate;

            if (token.isEmpty || tokenExpirationDate.isEmpty) {
              // return Routes.loginRoute;
              return Routes.homeRoute;
            }
            if (DateTime.parse(UserPreferences().tokenExpirationDate).toUtc()
            // .subtract(const Duration(days: 30))
            .isBefore(DateTime.now().toUtc())) {
              //token is expired
              // return Routes.loginRoute;
              return Routes.homeRoute;
            } else {
              return Routes.homeRoute;
            }
          },
        ),
        GoRoute(
          path: '/home',
          name: Routes.homeRoute,
          builder: (_, __) => const HomePage(),
        ),
      ],
    );
    return _router!;
  }
}
