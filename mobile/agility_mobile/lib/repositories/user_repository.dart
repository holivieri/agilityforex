import 'package:agility_mobile/errors/login_error.dart';

import '../services/user_service.dart';

class UserRepository {
  UserRepository(this.userService);

  final UserService userService;

  Future<dynamic> login(String? userName, String? password) async {
    if (userName == null || password == null) {
      return LoginError(
        code: '1',
        description: 'username and password are mandatory',
      );
    }

    return userService.login(userName, password);
  }

  // Future<String> getFacebookToken() async {
  //   return SocialSignInService.getFacebookToken();
  // }

  // Future<dynamic> signInWithFacebook(String facebookToken) async {
  //   return SocialSignInService.signInWithFacebook(facebookToken);
  // }

  // Future<String> getGoogleToken() async {
  //   return SocialSignInService.getGoogleToken();
  // }

  // Future<dynamic> signInWithGoogle(String googleToken) async {
  //   return SocialSignInService.signInWithGoogle(googleToken);
  // }
}
