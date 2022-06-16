import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'dart:core';
// To parse this JSON data, do
//
//     final profil = profilFromJson(jsonString);
// 
// import 'dart:convert';

Profil profilFromJson(String str) => Profil.fromJson(json.decode(str));

String profilToJson(Profil data) => json.encode(data.toJson());

class Profil {
    Profil({
        this.success,
        this.message,
        this.id,
        this.namaPelamar,
        this.tanggalLahir,
        this.telpPelamar,
        this.jenisKelamin,
        this.agama,
        this.alamatPelamar,
        this.cvPelamar,
        this.universitas,
        this.jurusan,
        this.prodi,
        this.pengalaman,
        this.posisi,
        this.perusahaan,
        this.tahun,
        this.spesialis,
        this.lokasi,
        this.gaji,
        this.email,
    });

    bool? success;
    String? message;
    int? id;
    String? namaPelamar;
    DateTime? tanggalLahir;
    String? telpPelamar;
    String? jenisKelamin;
    String? agama;
    String? alamatPelamar;
    String? cvPelamar;
    String? universitas;
    String? jurusan;
    String? prodi;
    String? pengalaman;
    String? posisi;
    String? perusahaan;
    String? tahun;
    String? spesialis;
    String? lokasi;
    String? gaji;
    String? email;

    factory Profil.fromJson(Map<String, dynamic> json) => Profil(
        success: json["success"],
        message: json["message"],
        id: json["id"],
        namaPelamar: json["nama_pelamar"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        telpPelamar: json["telp_pelamar"],
        jenisKelamin: json["jenis_kelamin"],
        agama: json["agama"],
        alamatPelamar: json["alamat_pelamar"],
        cvPelamar: json["cv_pelamar"],
        universitas: json["universitas"],
        jurusan: json["jurusan"],
        prodi: json["prodi"],
        pengalaman: json["pengalaman"],
        posisi: json["posisi"],
        perusahaan: json["perusahaan"],
        tahun: json["tahun"],
        spesialis: json["spesialis"],
        lokasi: json["lokasi"],
        gaji: json["gaji"],
        email: json["email"],
    );


    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "id": id,
        "nama_pelamar": namaPelamar,
        "email": email,
        
        //biodata
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir?.day.toString().padLeft(2, '0')}",
        "telp_pelamar": telpPelamar,
        "jenis_kelamin": jenisKelamin,
        "agama": agama,
        "alamat_pelamar": alamatPelamar,

        //gk usah ditampilno
        "cv_pelamar": cvPelamar,

        //pendidikan
        "universitas": universitas,
        "jurusan": jurusan,
        "prodi": prodi,
        "tahun": tahun,
        
        //pengalaman
        "pengalaman": pengalaman,
        "posisi": posisi,
        "perusahaan": perusahaan,
        "spesialis": spesialis,
        "lokasi": lokasi,
        "gaji": gaji,
    };
}
