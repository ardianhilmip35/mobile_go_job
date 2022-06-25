import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_go_job/shared/shared.dart';

class Informasi extends StatefulWidget {
  const Informasi({Key? key}) : super(key: key);

  @override
  State<Informasi> createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondarycolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'informasi'.tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                constraints: BoxConstraints(maxHeight: double.infinity),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1)),
                child: Column(
                  children: <Widget>[
                    Text('Selamat Datang di Aplikasi Go Job',
                        style:
                            GoogleFonts.poppins(fontSize:15 ,fontWeight: FontWeight.bold)),
                   
                  ],
                ),
              )
            ],
          )),
    );
  }
}
