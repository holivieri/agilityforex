import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_preferences.dart';
import 'routes/router.dart';
import 'routes/routes.dart';
import 'themes/theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  String getInitialRoute() {
    final token = UserPreferences().deviceToken;
    final tokenExpirationDate = UserPreferences().tokenExpirationDate;

    if (token.isEmpty || tokenExpirationDate.isEmpty) {
      //return Routes.loginRoute;
      return Routes.homeRoute;
    }
    if (DateTime.parse(UserPreferences().tokenExpirationDate).toUtc()
    // .subtract(const Duration(days: 30))
    .isBefore(DateTime.now().toUtc())) {
      //token is expired
      //return Routes.loginRoute;
      return Routes.homeRoute;
    } else {
      return Routes.homeRoute;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      routerConfig: myRouter,
      scaffoldMessengerKey: messengerKey,
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme:
          UserPreferences().isDarkModeOn
              ? MyThemes.darkTheme
              : MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
    );
  }
}
