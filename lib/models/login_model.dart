// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        required this.message,
        required this.accessToken,
        required this.tokenType,
        required this.id,
    });

    String? message;
    String? accessToken;
    String? tokenType;
    int? id;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "message": message.toString(),
        "access_token": accessToken.toString(),
        "token_type": tokenType.toString(),
        "id": id.toString(),
    };
}