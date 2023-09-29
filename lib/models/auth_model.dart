// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

import 'package:citizen_app/models/api_response_model.dart';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel extends ApiResponse<Data> {

  AuthModel({
    required int statusCode,
    required String message,
    required Data data,
  }) : super(
    statusCode: statusCode,
    message: message,
    data: data,
  );

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
