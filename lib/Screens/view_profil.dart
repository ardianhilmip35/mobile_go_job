import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/pendidikan.dart';
import 'package:mobile_go_job/controller/logincontroller.dart';
import 'package:mobile_go_job/Screens/edit_profil.dart';
import 'package:mobile_go_job/Screens/pengalaman.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Notifikasi/alert.dart';
import '../Notifikasi/toast.dart';
import '../Services/auth_services.dart';

class ViewProfil extends StatefulWidget {
  const ViewProfil({Key? key}) : super(key: key);

  @override
  State<ViewProfil> createState() => _ViewProfilState();
}

class _ViewProfilState extends State<ViewProfil> {
  final controller = Get.put(LoginController());
  String? _namaPelamar,
      _email,
      _noHp,
      _alamat,
      _kelamin,
      _agama,
      _tanggalLahir,
      _universitas,
      _jurusan,
      _prodi,
      _tahun,
      _pengalaman,
      _posisi,
      _perusahaan,
      _spesialis,
      _lokasi,
      _gaji;
  final _alert = ShowAlert();
  final _toast = ShowToast();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String idUser = pref.getString("id") ?? "";
    AuthServices.getUser(idUser).then((value) {
      setState(() {
        _namaPelamar = value.namaPelamar.toString();
        _email = value.email.toString();
        _noHp = value.telpPelamar.toString();
        _alamat = value.alamatPelamar.toString();
        _kelamin = value.jenisKelamin.toString();
        _agama = value.agama.toString();
        _tanggalLahir = value.tanggalLahir.toString();
        _universitas = value.universitas.toString();
        _jurusan = value.jurusan.toString();
        _prodi = value.prodi.toString();
        _tahun = value.tahun.toString();
        _pengalaman = value.pengalaman.toString();
        _posisi = value.posisi.toString();
        _perusahaan = value.perusahaan.toString();
        _spesialis = value.spesialis.toString();
        _lokasi = value.lokasi.toString();
        _gaji = value.gaji.toString();
      });
    });
  }

  _userSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("nama_pelamar", _namaPelamar.toString());
    pref.setString("alamat_pelamar", _alamat.toString());
    pref.setString("agama", _agama.toString());
    pref.setString("telp_pelamar", _noHp.toString());
    pref.setString("jenis_kelamin", _kelamin.toString());
    pref.setString("tanggal_lahir", _tanggalLahir.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "lihatprofil".tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
        leading: IconButton(
          //untuk back button
          iconSize: 30,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: IconButton(
                alignment: Alignment.topRight,
                onPressed: () {
                  _userSession();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfil()));
                },
                icon: Icon(Icons.edit),
                color: primarycolor,
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: double.infinity),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          //Container Foto Profil
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: primarycolor, width: 4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            //Icon Foto Profil
                            Icons.person,
                            color: primarycolor,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //Container Nama Profil
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$_namaPelamar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "$_noHp",
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.grey),
                            ),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Text(
                              "|",
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.grey),
                            ),
                            Padding(padding: EdgeInsets.only(right: 5)),
                            Text(
                              '$_email',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 170,
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: primarycolor)),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 7)),
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Icon(Icons.person_add),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "biodata".tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'tanggallahir'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'alamat'.tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 3, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$_tanggalLahir',
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              '$_alamat',
                              style: GoogleFonts.poppins(fontSize: 15),
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'agama'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'jeniskelamin'.tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 3, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$_agama',
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              '$_kelamin',
                              style: GoogleFonts.poppins(fontSize: 15),
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: double.infinity),
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: primarycolor)),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 7)),
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Icon(Icons.school),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "pendidikan".tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Universitas'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'jurusan'.tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 3, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$_universitas',
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              '$_jurusan',
                              style: GoogleFonts.poppins(fontSize: 15),
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'prodi'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'tahun'.tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 3, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$_prodi',
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              '$_tahun',
                              style: GoogleFonts.poppins(fontSize: 15),
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: GestureDetector(
                        child: Text(
                          'editpendidikan'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: primarycolor),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPendidikan()),
                          );
                        },
                      ))
                    ]),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: double.infinity),
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: primarycolor)),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 7)),
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Icon(Icons.business_center),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "pengalaman".tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Text(
                      '$_pengalaman',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'posisi'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'pernahbekerja'.tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$_posisi',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              '$_perusahaan',
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'spesialis'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'lokasi'.tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 3, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$_spesialis',
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              '$_lokasi',
                              style: GoogleFonts.poppins(fontSize: 15),
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'gaji'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 3, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$_gaji',
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: GestureDetector(
                        child: Text(
                          'tambahpengalaman'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: primarycolor),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Pengalaman()),
                          );
                        },
                      ))
                    ]),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
