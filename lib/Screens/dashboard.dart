import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/lowongan_pekerjaan.dart';
import 'package:mobile_go_job/Screens/profil.dart';
import 'package:mobile_go_job/Screens/simpan_lowongan.dart';
import 'package:mobile_go_job/controller/logincontroller.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                            controller.googleAccount.value?.displayName ?? '',
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
                                            MediaQuery.of(context).size.width /2.3,
                                        height: 145,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10)),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /2.2,
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
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              "list".tr,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              "lihat".tr,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
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
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Text Job",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "Text Job",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                            iconSize: 45,
                                            color: _iconColor,
                                            onPressed: () {
                                              setState(() {
                                                if (_iconColor == Colors.grey) {
                                                  _iconColor = primarycolor;
                                                } else {
                                                  _iconColor = Colors.grey;
                                                }
                                              });
                                            },
                                            icon: Icon(Icons.bookmark)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text('buka'.tr),
                                        style: ElevatedButton.styleFrom(
                                            primary: primarycolor,
                                            shape: StadiumBorder()),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
