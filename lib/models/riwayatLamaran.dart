// To parse this JSON data, do
//
//     final riwayatLamaran = riwayatLamaranFromJson(jsonString);

import 'dart:convert';

RiwayatLamaran riwayatLamaranFromJson(String str) => RiwayatLamaran.fromJson(json.decode(str));

String riwayatLamaranToJson(RiwayatLamaran data) => json.encode(data.toJson());

class RiwayatLamaran {
    RiwayatLamaran({
      required this.pelamarId,
      required this.lowonganId,
      required this.deskripsiLamaran,
      required this.kode,
    });

    String? pelamarId;
    String? lowonganId;
    String? deskripsiLamaran;
    int? kode;

    factory RiwayatLamaran.fromJson(Map<String, dynamic> json) => RiwayatLamaran(
        pelamarId: json["pelamar_id"],
        lowonganId: json["lowongan_id"],
        deskripsiLamaran: json["deskripsi_lamaran"],
        kode: json["kode"],
    );

    Map<String, dynamic> toJson() => {
        "pelamar_id": pelamarId,
        "lowongan_id": lowonganId,
        "deskripsi_lamaran": deskripsiLamaran,
        "kode": kode,
    };
}
