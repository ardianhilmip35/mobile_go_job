import 'package:flutter/material.dart';
import 'package:go_job/controller/logincontroller.dart';
import 'package:go_job/pages/editprofil.dart';
import 'package:go_job/pages/pendidikan.dart';
import 'package:go_job/pages/pengalaman.dart';
import 'package:go_job/shared/shared.dart';
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
                            Icon(Icons.person_add),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "biodata".tr,
                              style: GoogleFonts.poppins(fontSize: 20),
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
                          'tanggallahir'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              '1-1-2000',
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
                          'alamat'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'Jember',
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
                              'Krislam',
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
                          'nohp'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              '0812345679',
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
                          'jeniskelamin'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'perempuan',
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
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
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'universitas'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'Politeknik Negeri Jember',
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
                          'jurusan'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'Teknologi Informasi',
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
                              'Teknik Informatika',
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
                          'tahun'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              '2022',
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
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontSize: 15),
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
                              'Manager',
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
                          'perusahaan'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'PT Alfamart',
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
                              '-',
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
                          'lokasi'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'Jakarta',
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
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              'Rp. 1.000.000',
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
          ],
        ),
      ),
    );
  }
}
