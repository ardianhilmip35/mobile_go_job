// To parse this JSON data, do
//
//     final updatePendidikan = updatePendidikanFromJson(jsonString);

import 'dart:convert';

UpdatePendidikan updatePendidikanFromJson(String str) => UpdatePendidikan.fromJson(json.decode(str));

String updatePendidikanToJson(UpdatePendidikan data) => json.encode(data.toJson());

class UpdatePendidikan {
    UpdatePendidikan({
      required this.kode,
      required this.pesan,
      required this.data,
    });

    int kode;
    String pesan;
    Data data;

    factory UpdatePendidikan.fromJson(Map<String, dynamic> json) => UpdatePendidikan(
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
      required this.portofolioPelamar,
      required this.updatedAt,
      required this.createdAt,
      required this.id,
    });

    String pelamarId;
    String lowonganId;
    String deskripsiLamaran;
    PortofolioPelamar portofolioPelamar;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        pelamarId: json["pelamar_id"],
        lowonganId: json["lowongan_id"],
        deskripsiLamaran: json["deskripsi_lamaran"],
        portofolioPelamar: PortofolioPelamar.fromJson(json["portofolio_pelamar"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "pelamar_id": pelamarId,
        "lowongan_id": lowonganId,
        "deskripsi_lamaran": deskripsiLamaran,
        "portofolio_pelamar": portofolioPelamar.toJson(),
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}

class PortofolioPelamar {
    PortofolioPelamar();

    factory PortofolioPelamar.fromJson(Map<String, dynamic> json) => PortofolioPelamar(
    );

    Map<String, dynamic> toJson() => {
    };
}
