import 'package:flutter/cupertino.dart';

import 'dart:convert';
// To parse this JSON data, do
//
//     final profil = profilFromJson(jsonString);
// 
// import 'dart:convert';

Profil profilFromJson(String str) => Profil.fromJson(json.decode(str));

String profilToJson(Profil data) => json.encode(data.toJson());

class Profil {
    Profil({
        required this.success,
        required this.message,
        required this.id,
        required this.namaPelamar,
        required this.email,
    });

    bool? success;
    String? message;
    int? id;
    String? namaPelamar;
    String? email;

    factory Profil.fromJson(Map<String, dynamic> json) => Profil(
        success: json["success"],
        message: json["message"],
        id: json["id"],
        namaPelamar: json["nama_pelamar"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "id": id,
        "nama_pelamar": namaPelamar,
        "email": email,
    };
}
