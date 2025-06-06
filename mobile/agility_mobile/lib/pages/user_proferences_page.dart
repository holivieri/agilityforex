import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_preferences.dart';
import '../themes/theme_provider.dart';

class UserPreferencesPage extends StatefulWidget {
  const UserPreferencesPage({super.key});

  @override
  State<UserPreferencesPage> createState() => _UserPreferencesPageState();
}

class _UserPreferencesPageState extends State<UserPreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return getBody(context);
  }

  Widget getBody(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Hero(
          tag: 'logoTag',
          child: Image.asset(
            'assets/common/app-icon-transparent.png',
            width: 300,
            height: 300,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Dark Mode'),
            Switch.adaptive(
              value: UserPreferences().isDarkModeOn,
              onChanged: (value) {
                themeProvider.toggleTheme(isOn: value);
                UserPreferences().isDarkModeOn = value;
              },
            ),
          ],
        ),
      ],
    );
  }
}
