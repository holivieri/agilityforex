import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.userName,
    required this.normalizedUserName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        userName: json['userName'],
        normalizedUserName: json['normalizedUserName'],
        email: json['email'],
        normalizedEmail: json['normalizedEmail'],
        emailConfirmed: json['emailConfirmed'],
      );

  final String id;
  final String userName;
  final String normalizedUserName;
  final String email;
  final String normalizedEmail;
  final bool emailConfirmed;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'normalizedUserName': normalizedUserName,
        'email': email,
        'normalizedEmail': normalizedEmail,
        'emailConfirmed': emailConfirmed,
      };
}
