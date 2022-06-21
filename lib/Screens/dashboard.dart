import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/detail_lowongan.dart';
import 'package:mobile_go_job/Screens/lamar_sekarang.dart';
import 'package:mobile_go_job/Screens/login.dart';
import 'package:mobile_go_job/Screens/lowongan_pekerjaan.dart';
import 'package:mobile_go_job/Screens/profil.dart';
import 'package:mobile_go_job/Screens/simpan_lowongan.dart';
import 'package:mobile_go_job/controller/logincontroller.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_go_job/Screens/localestring.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Notifikasi/alert.dart';
import '../Notifikasi/toast.dart';
import '../Services/auth_services.dart';
import '../models/lowongan_model.dart';

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
      pref.setString("id", _lowongan[_index].id.toString());
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

  Color _iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                color: secondarycolor,
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Row(children: <Widget>[
                          Text(
                            "$_namaPelamar",
                            // controller.googleAccount.value?.displayName ?? '',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: Colors.black),
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Container(
                            //Container Foto Profil
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              //Icon Foto Profil
                              Icons.person,
                              color: primarycolor,
                              size: 30,
                            ),
                          ),
                        ]),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                color: secondarycolor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      padding: EdgeInsets.all(30),
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
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.black),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            ElevatedButton(
                              onPressed: () {},
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
                      padding: EdgeInsets.all(10),
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
                        padding: EdgeInsets.only(top: 15.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemCount: _lowongan.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                constraints:
                                    BoxConstraints(maxHeight: double.infinity),
                                decoration: BoxDecoration(
                                  color: Colors.white,
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
                                                  IconButton(
                                                      iconSize: 45,
                                                      color: _iconColor,
                                                      onPressed: () {
                                                        setState(() {
                                                          if (_iconColor ==
                                                              Colors.grey) {
                                                            _iconColor =
                                                                primarycolor;
                                                          } else {
                                                            _iconColor =
                                                                Colors.grey;
                                                          }
                                                        });
                                                      },
                                                      icon:
                                                          Icon(Icons.bookmark)),
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
