import 'dart:convert';
import 'dart:math';
// import 'dart:ffi';
import 'package:searchfield/searchfield.dart';
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
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    // getLowongan();
    return Scaffold(
      backgroundColor: secondarycolor,
      appBar: AppBar(
        title: Text(
          "carilowongan".tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primarycolor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
        
            GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.only(top: 15.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 9 / 6),
              itemCount: _lowongan.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(1),
                        constraints: BoxConstraints(maxHeight: double.infinity),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primarycolor,
                          border: Border.all(color: primarycolor, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              _lowongan[index].namaperusahaan.toString(),
                              // "PT Patma Tirta Jaya",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              width: double.infinity,
                              constraints:
                                  BoxConstraints(maxHeight: double.infinity),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                // "Web Developtment Staff",
                                                _lowongan[index]
                                                    .namalowongan
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: primarycolor),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 20)),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.2,
                                          child: Text(
                                            // "Surabaya, Jawa Timur",
                                            _lowongan[index]
                                                .alamatperusahaan
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: primarycolor),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 30, left: 10, right: 10)),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                // "5 Hari yang lalu",
                                                _lowongan[index]
                                                    .gajipekerjaan
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: primarycolor),
                                              ),
                                              RaisedButton(
                                                textColor: Colors.white,
                                                color: primarycolor,
                                                child: Text(
                                                  'lamarsekarang'.tr,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  sessionDetailLowongan();
                                                  _index = index;
                                                  Route route =
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LamarSekarang());
                                                  Navigator.push(
                                                      context, route);
                                                },
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          12.0),
                                                ),
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
