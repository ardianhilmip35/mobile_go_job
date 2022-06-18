// To parse this JSON data, do
//
//     final lamaran = lamaranFromJson(jsonString);

import 'dart:convert';

Lamaran lamaranFromJson(String str) => Lamaran.fromJson(json.decode(str));

String lamaranToJson(Lamaran data) => json.encode(data.toJson());

class Lamaran {
    Lamaran({
      required this.kode,
      required this.pesan,
      required this.data,
    });

    int kode;
    String pesan;
    Data data;

    factory Lamaran.fromJson(Map<String, dynamic> json) => Lamaran(
        kode: json["kode"],
        pesan: json["pesan"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "kode": kode,
        "pesan": pesan,
        "data": data.toJson(),
    };
}

class Data {
    Data({
      required this.pelamarId,
      required this.lowonganId,
      required this.deskripsiLamaran,
      required this.updatedAt,
      required this.createdAt,
      required this.id,
    });

    String pelamarId;
    String lowonganId;
    String deskripsiLamaran;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        pelamarId: json["pelamar_id"],
        lowonganId: json["lowongan_id"],
        deskripsiLamaran: json["deskripsi_lamaran"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "pelamar_id": pelamarId,
        "lowongan_id": lowonganId,
        "deskripsi_lamaran": deskripsiLamaran,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}