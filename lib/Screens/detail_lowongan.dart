import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/profil_perusahaan.dart';
import 'package:mobile_go_job/models/lowongan_model.dart';
import 'package:mobile_go_job/shared/buttom_navigation.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/auth_services.dart';

class DetailLowongan extends StatefulWidget {
  const DetailLowongan({Key? key}) : super(key: key);

  @override
  State<DetailLowongan> createState() => _DetailLowonganState();
}

class _DetailLowonganState extends State<DetailLowongan> {
  String _namaPerusahaan = "",
      _namaPekerjaan = "",
      _alamatPerusahaan = "",
      _deskripsiPekerjaan = "",
      _gaji = "";

  // final _imgBaseUrl = Url.imageBaseUrl;

  _getSessionLowongan() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _namaPerusahaan = pref.getString("namaperusahaan").toString();
      _namaPekerjaan = pref.getString("namalowongan").toString();
      _alamatPerusahaan = pref.getString("alamatperusahaan").toString();
      _deskripsiPekerjaan = pref.getString("deskripsipekerjaan").toString();
      _gaji = pref.getString("gajipekerjaan").toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _getSessionLowongan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondarycolor,
      appBar: AppBar(
        title: Text(
          "detailpekerjaan".tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
        leading: IconButton(
          //untuk back button
          iconSize: 30,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MyBottomBar()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 8.0),
          child: Column(
            children: [
              // TextFormField(
              //   textInputAction: TextInputAction.search,
              //   style: Theme.of(context).textTheme.bodyText1,
              //   decoration: InputDecoration(
              //       labelText: "caripekerjaan".tr,
              //       border: OutlineInputBorder(),
              //       focusColor: Colors.grey,
              //       labelStyle:
              //           TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              //       prefixIcon: Icon(
              //         Icons.search,
              //       )),
              // ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: primarycolor, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MaterialButton(
                            color: secondarycolor,
                            child: Text(
                              "pekerjaan".tr,
                              style:
                                  TextStyle(fontSize: 20, color: primarycolor),
                            ),
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => DetailLowongan());
                              Navigator.push(context, route);
                            },
                          ),
                          MaterialButton(
                            child: Text(
                              "perusahaan".tr,
                              style:
                                  TextStyle(fontSize: 20, color: primarycolor),
                            ),
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => ProfilPerusahaan());
                              Navigator.push(context, route);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    // "PT Patma Tirta Jaya",
                    _namaPekerjaan.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: primarycolor),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 30)),
                            Text(
                              "IDR $_gaji /Bulan",
                              // _gaji.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: primarycolor),
                            ),
                          ]),
                    ],
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                padding: EdgeInsets.all(15),
                constraints: BoxConstraints(maxHeight: double.infinity),
                width: double.infinity,
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
                child: Text(
                  // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  _deskripsiPekerjaan.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
