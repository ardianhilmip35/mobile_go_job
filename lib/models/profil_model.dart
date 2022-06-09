// import 'package:flutter/cupertino.dart';

// class Profil {
//   Profil ({
//   required this.id, 
//   required this.nama_pelamar,
//   required this.telp_pelamar,
//   required this.tanggal_lahir,
//   required this.jenis_kelamin,
//   required this.agama,
//   required this.foto,
//   required this.alamat_pelamar,
//   required this.cv_pelamar,
//   required this.universitas,
//   required this.jurusan,
//   required this.pengalaman,
//   required this.posisi,
//   required this.perusahaan,
//   required this.tahun,
//   required this.spesialis,
//   required this.lokasi,
//   required this.gaji,
//   required this.email,
//   required this.password,
// });
//   int id;
//   String nama_pelamar;
//   String telp_pelamar;
//   DateTime tanggal_lahir;
//   String jenis_kelamin;
//   String agama;
//   String foto;
//   String alamat_pelamar;
//   String cv_pelamar;
//   String universitas;
//   String jurusan;
//   String prodi;
//   String pengalaman;
//   String posisi;
//   String perusahaan;
//   String tahun;
//   String spesialis;
//   String lokasi;
//   String gaji;
//   String email;
//   String password;
//   String tampilprofilURL = "http://127.0.0.1:8000/api/user";

//   factory Profil.fromJson(Map<String, dynamic> json) => Profil(
//     id: json['id'], 
//     nama_pelamar: json['nama_pelamar'], 
//     telp_pelamar: json['telp_pelamar'], 
//     tanggal_lahir: json['tanggal_lahir'], 
//     jenis_kelamin: json['jenis_kelamin'], 
//     agama: json['agama'], 
//     foto: json['foto'],
//     alamat_pelamar: json['alamat_pelamar'], 
//     cv_pelamar: json['cv_pelamar'], 
//     universitas: json['universitas'], 
//     jurusan: json['jurusan'], 
//     pengalaman: json['pengalaman'], 
//     posisi: json['posisi'], 
//     perusahaan: json['perusahaan'], 
//     tahun: json['tahun'], 
//     spesialis: json['spesialis'],
//     lokasi: json['lokasi'], 
//     gaji: json['gaji'], 
//     email: json['email'], 
//     password: json['password']);

//     Map<String, dynamic> toJson() => {
//       "id": id,
//       "nama_pelamar": nama_pelamar,
//       "telp_pelamar": telp_pelamar,
//       "tanggal_lahir": tanggal_lahir,
//       "jenis_kelammin": jenis_kelamin,
//       "agama": agama,
//       "foto": foto,
//       "alamat_pelamar": alamat_pelamar,
//       "cv_pelamar": cv_pelamar,
//       "unversitas": universitas,
//       "jurusan": jurusan, 
//       "pengalaman": ['pengalaman'], 
//       "posisi": ['posisi'], 
//       "perusahaan": ['perusahaan'], 
//       "tahun": ['tahun'], 
//       "spesialis": ['spesialis'],
//       "lokasi": ['lokasi'], 
//       "gaji": ['gaji'], 
//       "email": ['email'], 
//       "password": ['password'
//     }
// }

