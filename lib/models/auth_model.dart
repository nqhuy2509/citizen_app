// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final int statusCode;
  final String message;
  final Data data;

  AuthModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    statusCode: json["statusCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final String email;
  final String accessToken;

  Data({
    required this.email,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "accessToken": accessToken,
  };
}
