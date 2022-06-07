import 'package:flutter/material.dart';
import 'package:mobile_go_job/controller/logincontroller.dart';
import 'package:mobile_go_job/Screens/edit_profil.dart';
import 'package:mobile_go_job/Screens/pengalaman.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ViewProfil extends StatefulWidget {
  const ViewProfil({Key? key}) : super(key: key);

  @override
  State<ViewProfil> createState() => _ViewProfilState();
}

class _ViewProfilState extends State<ViewProfil> {
  final controller = Get.put(LoginController());

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfil()));
                },
                icon: Icon(Icons.edit),
                color: primarycolor,
              ),
            ),
            Container(
              height: 170,
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
                          controller.googleAccount.value?.displayName ?? '',
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
                              "0882153572313",
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
                              controller.googleAccount.value?.email ?? '',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        )
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
                              "pengalamankerja".tr,
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 100)),
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
                ],
              ),
            ),
            Container(
              height: 180,
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: primarycolor)),
              child: Column(
                children: <Widget>[
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
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "pendidikan".tr,
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Teknik Informatika",
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: primarycolor)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Icon(Icons.emoji_objects),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "keterampilan".tr,
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
