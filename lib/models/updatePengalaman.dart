
// To parse this JSON data, do
//
//     final updatePengalaman = updatePengalamanFromJson(jsonString);

import 'dart:convert';

UpdatePengalaman updatePengalamanFromJson(String str) => UpdatePengalaman.fromJson(json.decode(str));

String updatePengalamanToJson(UpdatePengalaman data) => json.encode(data.toJson());

class UpdatePengalaman {
    UpdatePengalaman({
      required  this.id,
      required  this.pengalaman,
      required  this.posisi,
      required  this.perusahaan,
      required  this.spesialis,
      required  this.lokasi,
      required  this.gaji,
      required  this.kode,
      required  this.pesan,
    });

    String? id;
    String? pengalaman;
    String? posisi;
    String? perusahaan;
    String? spesialis;
    String? lokasi;
    String? gaji;
    int? kode;
    String? pesan;

    factory UpdatePengalaman.fromJson(Map<String, dynamic> json) => UpdatePengalaman(
        id: json["id"],
        pengalaman: json["pengalaman"],
        posisi: json["posisi"],
        perusahaan: json["perusahaan"],
        spesialis: json["spesialis"],
        lokasi: json["lokasi"],
        gaji: json["gaji"],
        kode: json["kode"],
        pesan: json["pesan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pengalaman": pengalaman,
        "posisi": posisi,
        "perusahaan": perusahaan,
        "spesialis": spesialis,
        "lokasi": lokasi,
        "gaji": gaji,
        "kode": kode,
        "pesan": pesan,
    };
}
