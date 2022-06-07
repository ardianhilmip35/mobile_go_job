import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_go_job/shared/shared.dart';

class RiwayatLamaran extends StatefulWidget {
  const RiwayatLamaran({Key? key}) : super(key: key);

  @override
  State<RiwayatLamaran> createState() => _RiwayatLamaranState();
}

class _RiwayatLamaranState extends State<RiwayatLamaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "history".tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
      ),
      body: SingleChildScrollView(
        child: Container(
         height: MediaQuery.of(context).size.height * 100, 
          padding: EdgeInsets.all(20),
          width: double.infinity,
          color: secondarycolor,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('PT GO Job',
                        style:
                            GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    Text('-Software Engineering', style: GoogleFonts.poppins()),
                    Text(
                        'Handling many projects related with digital media marketing',
                        style: GoogleFonts.poppins()),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[Text('22/04/2022')],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
