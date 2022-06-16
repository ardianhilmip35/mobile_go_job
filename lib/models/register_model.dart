// To parse this JSON data, do
//
//     final lowongan = lowonganFromJson(jsonString);

import 'dart:convert';

Lowongan lowonganFromJson(String str) => Lowongan.fromJson(json.decode(str));

String lowonganToJson(Lowongan data) => json.encode(data.toJson());

class Lowongan {
    Lowongan({
      required this.data,
      required this.accessToken,
      required this.tokenType,
      required this.pesan,
    });

    Data data;
    String accessToken;
    String tokenType;
    String pesan;

    factory Lowongan.fromJson(Map<String, dynamic> json) => Lowongan(
        data: Data.fromJson(json["data"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        pesan: json["pesan"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
        "pesan": pesan,
    };
}

class Data {
    Data({
      required this.namaPelamar,
      required this.email,
      required this.updatedAt,
      required this.createdAt,
      required this.id,
    });

    String namaPelamar;
    String email;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        namaPelamar: json["nama_pelamar"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nama_pelamar": namaPelamar,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
