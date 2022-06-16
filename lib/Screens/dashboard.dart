import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/detail_lowongan.dart';
import 'package:mobile_go_job/Screens/lamar_sekarang.dart';
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
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
    _getData();
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
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "caripekerjaan".tr,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 5)),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  height: 300,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        height: 145,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10)),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        height: 145,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
                          Text(
                            "lihat".tr,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 15.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                      ),
                      itemCount: _lowongan.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                        child:  Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                              height: 120,
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
                                                  color: Colors.white, width: 4),
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
                                            width:
                                                MediaQuery.of(context).size.width /
                                                    1.44,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      // "Web Developer",
                                                      _lowongan[index].namalowongan.toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      // "Surabaya",
                                                      _lowongan[index].alamatperusahaan.toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                    iconSize: 45,
                                                    color: _iconColor,
                                                    onPressed: () {
                                                      setState(() {
                                                        if (_iconColor ==
                                                            Colors.grey) {
                                                          _iconColor = primarycolor;
                                                        } else {
                                                          _iconColor = Colors.grey;
                                                        }
                                                      });
                                                    },
                                                    icon: Icon(Icons.bookmark)),
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
                          ],
                        )
                        );
                      
                      }
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
