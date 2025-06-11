import 'dart:io';

import 'package:agility_mobile/app.dart';
import 'package:agility_mobile/blocs/users/users_bloc.dart';
import 'package:agility_mobile/models/user_preferences.dart';
import 'package:agility_mobile/repositories/user_repository.dart';
import 'package:agility_mobile/services/user_service.dart';
import 'package:agility_mobile/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

bool platformIsNotWeb() {
  return !kIsWeb;
}

Future<void> runMainApp({required FirebaseOptions firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();

  final UserService userService = UserService(Client());
  await Firebase.initializeApp(options: firebaseOptions);
  // final NotificationsService notificationsService = NotificationsService(
  //   Client(),
  // );
  final UserRepository userRepository = UserRepository(userService);

  // final NotificationsRespository notificationsRepository =
  //     NotificationsRespository(notificationsService);

  final userPreferences = UserPreferences();
  await userPreferences.init();

  //await PushNotificationsService.initializeApp();

  if (kIsWeb) {
    UserPreferences().platform = 'web';
  } else {
    if (Platform.isAndroid) {
      UserPreferences().platform = 'android';
    } else if (Platform.isIOS) {
      UserPreferences().platform = 'ios';
    }
  }

  // setPathUrlStrategy(); //to remove # from url
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
          create:
              (BuildContext context) =>
                  UsersBloc(userRepository)..add(InitializeUser()),
        ),
        // BlocProvider<NotificationsBloc>(
        //   create:
        //       (BuildContext context) =>
        //           NotificationsBloc(notificationsRepository)
        //             ..add(GettingUserNotifications()),
        // ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
          // ChangeNotifierProvider<LanguageProvider>(
          //   create: (_) => LanguageProvider(),
          // ),
        ],
        child: GestureDetector(
          onTap: () {
            //to minimize the keyboard when tapping outside of a Textfield.
            //Can move to MyApp to implement in the entire app
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MyApp(),
        ),
      ),
    ),
  );
}
