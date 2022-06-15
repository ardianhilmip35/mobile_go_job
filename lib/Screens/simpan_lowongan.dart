import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/lamar_sekarang.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SimpanLowongan extends StatefulWidget {
  const SimpanLowongan({Key? key}) : super(key: key);

  @override
  State<SimpanLowongan> createState() => _SimpanLowonganState();
}

class _SimpanLowonganState extends State<SimpanLowongan> {
  Color _iconColor = primarycolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lowongantersimpan'.tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
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
                          "PT Patma Tirta Jaya",
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Web Developtment Staff",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: primarycolor),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 20)),
                                    Text(
                                      "Surabaya, Jawa Timur",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: primarycolor),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 70)),
                                    Text(
                                      "5 Hari yang lalu",
                                      style: TextStyle(
                                          fontSize: 20, color: primarycolor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                      alignment: Alignment.topRight,
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
                                  Padding(
                                    padding: EdgeInsets.only(top: 70),
                                  ),
                                  RaisedButton(
                                    textColor: Colors.white,
                                    color: primarycolor,
                                    child: Text(
                                      'lamar'.tr,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    onPressed: () {
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
                              )),
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
    );
  }
}
