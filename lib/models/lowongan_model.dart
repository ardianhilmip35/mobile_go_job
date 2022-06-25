// To parse this JSON data, do
//
//     final lowongan = lowonganFromJson(jsonString);

import 'dart:convert';

List<Lowongan> lowonganFromJson(String str) => List<Lowongan>.from(json.decode(str).map((x) => Lowongan.fromJson(x)));

String lowonganToJson(List<Lowongan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lowongan {
    Lowongan({
      required this.idlowongan,
      required this.usersId,
      required this.namalowongan,
      required this.jenispekerjaan,
      required this.tingkatjabatan,
      required this.gajipekerjaan,
      required this.spesialis,
      required this.pengalaman,
      required this.deskripsipekerjaan,
      required this.namaperusahaan,
      required this.deskripsiperusahaan,
      required this.pendidikan,
      required this.alamatperusahaan,
      required this.logo,
      required this.gedung,
      required this.createdAt,
      required this.updatedAt,
    });

    int idlowongan;
    String usersId;
    String namalowongan;
    String jenispekerjaan;
    String tingkatjabatan;
    String gajipekerjaan;
    String spesialis;
    String pengalaman;
    String deskripsipekerjaan;
    String namaperusahaan;
    String deskripsiperusahaan;
    String pendidikan;
    String alamatperusahaan;
    String logo;
    String gedung;
    DateTime createdAt;
    DateTime updatedAt;

    factory Lowongan.fromJson(Map<String, dynamic> json) => Lowongan(
        idlowongan: json["idlowongan"],
        usersId: json["users_id"],
        namalowongan: json["namalowongan"],
        jenispekerjaan: json["jenispekerjaan"],
        tingkatjabatan: json["tingkatjabatan"],
        gajipekerjaan: json["gajipekerjaan"],
        spesialis: json["spesialis"],
        pengalaman: json["pengalaman"],
        deskripsipekerjaan: json["deskripsipekerjaan"],
        namaperusahaan: json["namaperusahaan"],
        deskripsiperusahaan: json["deskripsiperusahaan"],
        pendidikan: json["pendidikan"],
        alamatperusahaan: json["alamatperusahaan"],
        logo: json["logo"],
        gedung: json["gedung"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "idlowongan": idlowongan,
        "users_id": usersId,
        "namalowongan": namalowongan,
        "jenispekerjaan": jenispekerjaan,
        "tingkatjabatan": tingkatjabatan,
        "gajipekerjaan": gajipekerjaan,
        "spesialis": spesialis,
        "pengalaman": pengalaman,
        "deskripsipekerjaan": deskripsipekerjaan,
        "namaperusahaan": namaperusahaan,
        "deskripsiperusahaan": deskripsiperusahaan,
        "pendidikan": pendidikan,
        "alamatperusahaan": alamatperusahaan,
        "logo": logo,
        "gedung": gedung,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
