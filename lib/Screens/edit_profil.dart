import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/login.dart';
import 'package:mobile_go_job/Screens/profil.dart';
import 'package:mobile_go_job/Screens/view_profil.dart';
import 'package:mobile_go_job/Services/auth_services.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Notifikasi/alert.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  String? _idUser, _tglLahir;

  final _formKey = GlobalKey<FormState>();
  final _alert = ShowAlert();

  var _namaController = TextEditingController();
  var _alamatController = TextEditingController();
  var _agamaController = TextEditingController();
  var _noHpController = TextEditingController();
  var _jnsKelaminController = TextEditingController();
  var _tglLahirController = TextEditingController();

  _getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _idUser = prefs.getString('id').toString();
      String? _namaPelamar = prefs.getString('nama_pelamar').toString();
      String? _alamat = prefs.getString('alamat_pelamar').toString();
      String? _agama = prefs.getString('agama').toString();
      String? _noHp = prefs.getString('telp_pelamar').toString();
      String? _kelamin = prefs.getString('jenis_kelamin').toString();
      _tglLahir = prefs.getString('tanggal_lahir').toString();

      _namaController = TextEditingController(text: _namaPelamar);
      _alamatController = TextEditingController(text: _alamat);
      _agamaController = TextEditingController(text: _agama);
      _noHpController = TextEditingController(text: _noHp);
      _jnsKelaminController = TextEditingController(text: _kelamin);
      _tglLahirController = TextEditingController(text: _tglLahir);
    });
  }

  _updateUser() {
    AuthServices.updatePelamar(
            _idUser.toString(),
            _namaController.text,
            _alamatController.text,
            _agamaController.text,
            _noHpController.text,
            _jnsKelaminController.text,
            _tglLahirController.text)
        .then((value) {
      setState(() {
        if (value.kode == 1) {
          // _alert.coolAlertSucces(value.pesan, context, "OK");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ViewProfil()));
        } else {
          _alert.coolAlertFail(value.pesan, context, "OK");
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondarycolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "editprofil".tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "nama".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Anisa",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Text(
                "alamat".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _alamatController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Jember",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Text(
                "agama".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _agamaController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Islam",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Text(
                "nohp".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _noHpController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "085236815716",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Text(
                "jeniskelamin".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _jnsKelaminController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Laki - Laki / Perempuan",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Text(
                "tanggallahir".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _tglLahirController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "yyyy-mm-dd",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
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
                      onPressed: () {
                        _updateUser();
                      },
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
