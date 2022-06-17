import 'package:flutter/cupertino.dart';

import 'dart:core';
// To parse this JSON data, do
//
//     final update = updateFromJson(jsonString);

import 'dart:convert';

Update updateFromJson(String str) => Update.fromJson(json.decode(str));

String updateToJson(Update data) => json.encode(data.toJson());

class Update {
    Update({
      required this.id,
      required this.namaPelamar,
      required this.telpPelamar,
      required this.tanggalLahir,
      required this.jenisKelamin,
      required this.agama,
      required this.alamatPelamar,
      required this.kode,
      required this.pesan,
    });

    String id;
    String namaPelamar;
    String alamatPelamar;
    String agama;
    String telpPelamar;
    String jenisKelamin;
    DateTime tanggalLahir;
    int kode;
    String pesan;

    factory Update.fromJson(Map<String, dynamic> json) => Update(
        id: json["id"],
        namaPelamar: json["nama_pelamar"],
        telpPelamar: json["telp_pelamar"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        agama: json["agama"],
        alamatPelamar: json["alamat_pelamar"],
        kode: json["kode"],
        pesan: json["pesan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_pelamar": namaPelamar,
        "telp_pelamar": telpPelamar,
        "tanggal_lahir": "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "agama": agama,
        "alamat_pelamar": alamatPelamar,
        "kode": kode,
        "pesan": pesan,
    };
}
