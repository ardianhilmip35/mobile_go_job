import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/detail_lowongan.dart';
import 'package:mobile_go_job/Screens/informasi.dart';
import 'package:mobile_go_job/Screens/lamar_sekarang.dart';
import 'package:mobile_go_job/Screens/login.dart';
import 'package:mobile_go_job/Screens/lowongan_pekerjaan.dart';
import 'package:mobile_go_job/Screens/profil.dart';
import 'package:mobile_go_job/controller/logincontroller.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_go_job/Screens/localestring.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../Notifikasi/alert.dart';
import '../Notifikasi/toast.dart';
import '../Services/auth_services.dart';
import '../models/lowongan_model.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat.MMMEd().format(DateTime.now());

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? _namaPelamar;
  final _alert = ShowAlert();
  final _toast = ShowToast();

  int _index = 0;
  List<Lowongan> _lowongan = [];

  _getData() async {
    _lowongan = await AuthServices.getLowongan();
    if (mounted) {
      setState(() {
        _lowongan;
      });
    }
  }

  Future<void> sessionDetailLowongan() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("idlowongan", _lowongan[_index].idlowongan.toString());
      // pref.setString("logo", _lowongan[_index].logo.toString());
      pref.setString("namalowongan", _lowongan[_index].namalowongan.toString());
      pref.setString(
          "namaperusahaan", _lowongan[_index].namaperusahaan.toString());
      pref.setString(
          "alamatperusahaan", _lowongan[_index].alamatperusahaan.toString());
      pref.setString(
          "gajipekerjaan", _lowongan[_index].gajipekerjaan.toString());
      pref.setString("deskripsiperusahaan",
          _lowongan[_index].deskripsiperusahaan.toString());
      pref.setString(
          "deskripsipekerjaan", _lowongan[_index].deskripsipekerjaan);
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    _getData();
  }

  _cekLogin() async {
    String idUser;
    bool isLogin;
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool("is_login") ?? false;
    idUser = pref.getString("id_user") ?? "";
    setState(() {
      if (isLogin == false) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return const Login();
          }),
        );
      } else {
        Navigator.of(context);
      }
    });
  }

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String idUser = pref.getString("id") ?? "";
    AuthServices.getUser(idUser).then((value) {
      setState(() {
        _namaPelamar = value.namaPelamar.toString();
      });
    });
  }

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondarycolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Go Job",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          // automaticallyImplyLeading: false,
          backgroundColor: primarycolor,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 30)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          //Container Foto Profil
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: primarycolor, width: 4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            //Icon Foto Profil
                            Icons.person,
                            color: primarycolor,
                            size: 45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //Container Nama Profil
                    margin: EdgeInsets.only(left: 12, top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'halo'.tr,
                              style: GoogleFonts.poppins(fontSize: 17),
                            ),
                            Text(
                              "$_namaPelamar",
                              // controller.googleAccount.value?.displayName ?? '',
                              style: GoogleFonts.poppins(
                                  fontSize: 17, color: Colors.black),
                            ),
                            Text(
                              '👋,',
                              style: GoogleFonts.poppins(fontSize: 17),
                            ),
                          ],
                        ),
                        Text("$formattedDate",
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(padding: EdgeInsets.only(top: 12)),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5),
                color: secondarycolor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "informasi".tr,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Text(
                              "Untuk Informasi lebih lanjut silahkan klik tombol di bawah ini",
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.black),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Informasi()),
                                );
                              },
                              child: Text(
                                'info'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: primarycolor,
                                  shape: StadiumBorder()),
                            )
                          ]),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 17, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "list".tr,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              WidgetSpan(
                                  child: GestureDetector(
                                child: Text(
                                  'lihat'.tr,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LowonganPekerjaan()),
                                  );
                                },
                              ))
                            ]),
                          ),
                        ],
                      ),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10),
                        physics: ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, childAspectRatio: 7 / 2),
                        itemCount: _lowongan.length < 3 ? _lowongan.length : 3,
                        itemBuilder: (context, index) {
                          return InkWell(
                              child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                padding: EdgeInsets.only(
                                    left: 12, right: 12, top: 7, bottom: 7),
                                constraints:
                                    BoxConstraints(maxHeight: double.infinity),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 4),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.business_center,
                                                color: Colors.black,
                                                size: 40,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.44,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          // "Web Developer",
                                                          _lowongan[index]
                                                              .namalowongan
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          // "Surabaya",
                                                          _lowongan[index]
                                                              .alamatperusahaan
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Route route = MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailLowongan());
                                                Navigator.push(context, route);
                                              },
                                              child: Text('buka'.tr),
                                              style: ElevatedButton.styleFrom(
                                                  primary: primarycolor,
                                                  shape: StadiumBorder()),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                sessionDetailLowongan();
                                                _index = index;
                                                Route route = MaterialPageRoute(
                                                    builder: (context) =>
                                                        LamarSekarang());
                                                Navigator.push(context, route);
                                              },
                                              child: Text('lamar'.tr),
                                              style: ElevatedButton.styleFrom(
                                                  primary: primarycolor,
                                                  shape: StadiumBorder()),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10)),
                            ],
                          ));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
