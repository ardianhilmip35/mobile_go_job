import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/lamar_sekarang.dart';
import 'package:mobile_go_job/Services/auth_services.dart';
import 'package:mobile_go_job/models/lowongan_model.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_go_job/Services/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LowonganPekerjaan extends StatefulWidget {
  // final Lowongan lowongan;
  // final int id;
  // const LowonganPekerjaan({Key? key, required this.lowongan, required this.id}) : super(key: key);

  @override
  State<LowonganPekerjaan> createState() => _LowonganPekerjaanState();
}

class _LowonganPekerjaanState extends State<LowonganPekerjaan> {
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
      pref.setString("namaperusahaan", _lowongan[_index].namaperusahaan.toString());
      pref.setString("alamatperusahaan", _lowongan[_index].alamatperusahaan.toString());
      pref.setString("gajipekerjaan", _lowongan[_index].gajipekerjaan.toString());
      pref.setString("deskripsiperusahaan", _lowongan[_index].deskripsiperusahaan.toString());
      pref.setString("deskripsipekerjaan", _lowongan[_index].deskripsipekerjaan);
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    // getLowongan();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lowongan",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
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
        padding: EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 8.0),
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.search,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                  labelText: 'caripekerjaan'.tr,
                  border: OutlineInputBorder(),
                  focusColor: Color(0xFF0A9EA2),
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                  )),
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
                child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(1),
                    height: 315,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primarycolor,
                      border: Border.all(color: primarycolor, width: 4),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          //Container Foto Profil
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.grey, width: 4),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          _lowongan[index].namaperusahaan.toString(),
                          // "PT Patma Tirta Jaya",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          width: double.infinity,
                          height: 185,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      // "Web Developtment Staff",
                                      _lowongan[index].namalowongan.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: primarycolor),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 20)),
                                    Text(
                                      // "Surabaya, Jawa Timur",
                                      _lowongan[index].alamatperusahaan.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: primarycolor),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 70)),
                                    Text(
                                      // "5 Hari yang lalu",
                                      _lowongan[index].gajipekerjaan.toString(),
                                      style: TextStyle(
                                          fontSize: 20, color: primarycolor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                      alignment: Alignment.topRight,
                                      iconSize: 45,
                                      // color: _iconColor,
                                      onPressed: () {
                                        setState(() {
                                          // if (_iconColor == Colors.grey) {
                                          //   _iconColor = primarycolor;
                                          // } else {
                                          //   _iconColor = Colors.grey;
                                          // }
                                        });
                                      },
                                      icon: Icon(Icons.bookmark)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 70),
                                  ),
                                  RaisedButton(
                                    textColor: Colors.white,
                                    color: primarycolor,
                                    child: Text(
                                      'lamarsekarang'.tr,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    onPressed: () {
                                      sessionDetailLowongan();
                                      _index = index;
                                      Route route =
                                          MaterialPageRoute(builder: (context) => LamarSekarang());
                                      Navigator.push(context, route);
                                    },
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ],
                              )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              ),
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}
