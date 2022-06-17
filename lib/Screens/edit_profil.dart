import 'package:flutter/material.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "editprofil".tr,
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
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "nama".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Galuh",
                ),
              ),
              Text(
                "alamat".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Jember",
                ),
              ),
              Text(
                "agama".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Islam",
                ),
              ),
              Text(
                "nohp".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "08972736134",
                ),
              ),
              Text(
                "email".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "example@email.com",
                ),
              ),
              Text(
                "tanggallahir".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "01/01/2020",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Container(
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: primarycolor,
                      child: Text(
                        "simpan".tr,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  Container(
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text(
                        "batal".tr,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
