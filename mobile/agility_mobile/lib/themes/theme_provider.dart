import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme({required bool isOn}) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Color getSelectedIconColor() {
    if (isDarkMode) {
      return iconSelectedColor;
    } else {
      return iconLightThemeColor;
    }
  }

  Color getControlColor() {
    if (isDarkMode) {
      return darkControlColor;
    } else {
      return brightControlColor;
    }
  }
}

// ignore: avoid_classes_with_only_static_members
class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.white,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.black), //greenButtonColor),
    buttonTheme: const ButtonThemeData(buttonColor: greenButtonColor),
    colorScheme: const ColorScheme.dark().copyWith(surface: darkBackground),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: brightBackgroundWhite,
    primaryColor: Colors.black,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Colors.red),
    buttonTheme: const ButtonThemeData(buttonColor: greenButtonColor),
    colorScheme:
        const ColorScheme.light().copyWith(surface: Colors.pink.shade200),
  );
}
