import 'dart:convert';
import 'package:agility_mobile/errors/login_error.dart';
import 'package:agility_mobile/models/login_response_model.dart';
import 'package:http/http.dart';
import '../models/user_preferences.dart';
import '../utils/http.dart';

class UserService {
  UserService(this._client);

  final Client _client;

  String validatePasswordRules(String? password) {
    if (password == null) {
      return 'La clave no puede estar en blanco';
    }
    if (password.length < 6) {
      return 'La clave debe tener 6 o mas caracteres';
    }
    return 'Ok';
  }

  void saveUserProfileToLocal(String profile) {
    switch (profile) {
      case 'admin':
        UserPreferences().profile = MyProfile.admin;
        break;
      case 'employee':
        UserPreferences().profile = MyProfile.employee;
        break;
      case 'employer':
        UserPreferences().profile = MyProfile.employer;
        break;
      default:
        UserPreferences().profile = MyProfile.none;
        break;
    }
  }

  Future<dynamic> login(String userName, String password) async {
    final deviceToken = UserPreferences().deviceToken;
    final platform = UserPreferences().platform;

    final apiResponse = await _client.post(
      Uri.parse('$apiUrl/Authenticate/Login'),
      headers: returnHttpHeaders(),
      body: json.encode({
        'email': userName,
        'password': password,
        'userRole': '',
        'deviceToken': deviceToken,
        'platform': platform,
      }),
    );

    if (apiResponse.statusCode == 500) {
      return LoginError(
        code: '500',
        description: 'Internal server error. Try again later',
      );
    }
    if (apiResponse.statusCode == 400) {
      return LoginError(
        code: '400',
        description: 'Invalid username or password',
      );
    }

    final LoginResponse user = LoginResponse.fromJson(
      json.decode(apiResponse.body),
    );

    UserService(Client()).saveUserProfileToLocal(user.userProfile);

    return user;
  }

  Future<bool> followAnArtist(String artistId) async {
    final apiResponse = await _client.post(
      Uri.parse('$apiUrl/User/FollowAnArtist?artistId=$artistId'),
      headers: returnHttpHeaders(),
    );

    if (apiResponse.statusCode != 200) {
      return false;
    }
    final bool result = json.decode(apiResponse.body);
    return result;
  }
}
