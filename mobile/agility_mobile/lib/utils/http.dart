import 'dart:io';

import '../models/user_preferences.dart';

const String apiUrl = '{put your API url here}/api/v1';

const formUrlEncoded = 'application/x-www-form-urlencoded';
const applicationJson = 'application/json';
const binary = 'application/octet-stream';

Map<String, String> returnHttpHeaders({
  final String contentType = applicationJson,
}) {
  return {
    HttpHeaders.contentTypeHeader: contentType,
    HttpHeaders.authorizationHeader: 'Bearer ${UserPreferences().token}',
  };
}
