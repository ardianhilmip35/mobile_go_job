// import 'dart:ffi';
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mobile_go_job/Notifikasi/alert.dart';
import 'package:mobile_go_job/Notifikasi/toast.dart';
import 'package:mobile_go_job/controller/logincontroller.dart';
import 'package:mobile_go_job/Screens/lamar_sekarang.dart';
import 'package:mobile_go_job/Services/auth_services.dart';
import 'package:mobile_go_job/Screens/riwayat_lamaran.dart';
import 'package:mobile_go_job/Screens/simpan_lowongan.dart';
import 'package:mobile_go_job/Screens/view_profil.dart';
import 'package:mobile_go_job/main.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_go_job/Screens/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Profil extends StatefulWidget {

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String? _namaPelamar, _email;
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
      });
    });
  }

  Future<void> sessionPelamar() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
    //   pref.setString("id", _lowongan[_index].id.toString());
    //   // pref.setString("logo", _lowongan[_index].logo.toString());
    //   pref.setString("namalowongan", _lowongan[_index].namalowongan.toString());
    //   pref.setString("namaperusahaan", _lowongan[_index].namaperusahaan.toString());
    //   pref.setString("alamatperusahaan", _lowongan[_index].alamatperusahaan.toString());
    //   pref.setString("gajipekerjaan", _lowongan[_index].gajipekerjaan.toString());
    });
  }

  final Email email = Email(
    body: 'Hello,',
    subject: 'I Need Help',
    recipients: ['galuhapriliano30@gmail.com'],
    isHTML: false,
  );

  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'INDONESIA', 'locale': Locale('id', 'ID')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('gantibahasamu'.tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  confirmLogout(BuildContext context) {
    Widget cancel = FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Batal",
        ));
    Widget confirm = FlatButton(
        onPressed: () {
          Navigator.pop(context);
          _logout();
        },
        child: Text(
          "Logout",
        ));
    AlertDialog alert = AlertDialog(
      title: Text("Konfirmasi Logout"),
      content: Text("Apakah Anda yakin ingin keluar ?"),
      actions: [
        cancel,
        confirm,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("is_login");
      pref.clear();
    });
    _toast.showToast("Berhasil Logout");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Login(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'profil'.tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              //Container Profil
              height: 150,
              decoration: BoxDecoration(
                color: primarycolor,
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  CircleAvatar(
                      radius: 50,
                      child: Image.asset(
                        //untuk logo image
                        'assets/images/logo1.png',
                        height: 50,
                        width: 100,
                      )
                      // Image(
                      //         controller.googleAccount.value?.photoUrl ?? '')
                      //     .image,
                      ),
                  Container(
                    //Container Nama Profil
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "$_namaPelamar",
                          // "$_nama_pelamar",
                          // controller.googleAccount.value?.displayName ?? '',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        
                        Text(
                          // "$_email",
                          "$_email",
                          // controller.googleAccount.value?.displayName ?? '',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white),
                              
                        ),
                        Padding(padding: EdgeInsets.only(top: 12)),
                        RichText(
                          text: TextSpan(children: [
                            WidgetSpan(
                                child: GestureDetector(
                              child: Text(
                                'kelola'.tr,
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewProfil()),
                                );
                              },
                            ))
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //Container Button Riwayat Lamaran
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: primarycolor, width: 0.5),
              ),
              child: RaisedButton(
                //Button Riwayat Lamaran
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => RiwayatLamaran());
                  Navigator.push(context, route);
                },
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.history)),
                      Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'riwayat'.tr,
                            style: GoogleFonts.poppins(fontSize: 15.0),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              //Container Button Negara & Bahasa
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: primarycolor, width: 0.5),
              ),
              child: RaisedButton(
                //Button Negara & Bahasa
                onPressed: () {
                  buildLanguageDialog(context);
                },
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.language)),
                      Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'gantibahasa'.tr,
                            style: GoogleFonts.poppins(fontSize: 15.0),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              //Container Button Hubungi Kami
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: primarycolor, width: 0.5),
              ),
              child: RaisedButton(
                //Button Hubungi Kami
                onPressed: () async {
                  await FlutterEmailSender.send(email);
                },
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.phone)),
                      Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'hubungi'.tr,
                            style: GoogleFonts.poppins(fontSize: 15.0),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              //Container Button Logout
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: primarycolor, width: 0.5),
              ),
              child: RaisedButton(
                //Button Logout
                onPressed: () {
                  // controller.logout();
                  confirmLogout(context);
                },
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.logout)),
                      Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'keluar'.tr,
                            style: GoogleFonts.poppins(fontSize: 15.0),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  

  // void logout() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   var res = await AuthServices().logout();
  //   var body = jsonDecode(res);
  //   if (body['success']) {
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.remove('id');
  //     localStorage.remove('nama_pelamar');
  //     localStorage.remove('email');
  //     localStorage.remove('access_token');
  //     localStorage.clear();
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     // Navigator.pushReplacement(
  //     //     context, MaterialPageRoute(builder: (context) => WelcomePage()));
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => Login()),
  //         (Route<dynamic> route) => false);
  //   } else {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     ShowToast;
  //   }
  // }
}
