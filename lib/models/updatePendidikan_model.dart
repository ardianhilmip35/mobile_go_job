// To parse this JSON data, do
//
//     final updatePendidikan = updatePendidikanFromJson(jsonString);

import 'dart:convert';

UpdatePendidikan updatePendidikanFromJson(String str) => UpdatePendidikan.fromJson(json.decode(str));

String updatePendidikanToJson(UpdatePendidikan data) => json.encode(data.toJson());

class UpdatePendidikan {
    UpdatePendidikan({
      required this.id,
      required this.universitas,
      required this.jurusan,
      required this.prodi,
      required this.tahun,
      required this.kode,
      required this.pesan,
    });

    String? id;
    String? universitas;
    String? jurusan;
    String? prodi;
    String? tahun;
    int? kode;
    String? pesan;

    factory UpdatePendidikan.fromJson(Map<String, dynamic> json) => UpdatePendidikan(
        id: json["id"],
        universitas: json["universitas"],
        jurusan: json["jurusan"],
        prodi: json["prodi"],
        tahun: json["tahun"],
        kode: json["kode"],
        pesan: json["pesan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "universitas": universitas,
        "jurusan": jurusan,
        "prodi": prodi,
        "tahun": tahun,
        "kode": kode,
        "pesan": pesan,
    };
}
