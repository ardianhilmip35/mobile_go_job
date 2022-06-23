import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/view_profil.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Notifikasi/alert.dart';
import '../Services/auth_services.dart';

class EditPendidikan extends StatefulWidget {
  const EditPendidikan({Key? key}) : super(key: key);

  @override
  State<EditPendidikan> createState() => _EditPendidikanState();
}

class _EditPendidikanState extends State<EditPendidikan> {
  String? _idUser;

  final _formKey = GlobalKey<FormState>();
  final _alert = ShowAlert();

  var _universitasController = TextEditingController();
  var _jurusanController = TextEditingController();
  var _prodiController = TextEditingController();
  var _tahunLulusController = TextEditingController();

  _getPendidikanSession() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _idUser = prefs.getString('id').toString();
      String? _universitas = prefs.getString('universitas').toString();
      String? _jurusan = prefs.getString('jurusan').toString();
      String? _prodi = prefs.getString('prodi').toString();
      String? _tahunLulus = prefs.getString('tahun').toString();

      _universitasController = TextEditingController(text: _universitas);
      _jurusanController = TextEditingController(text: _jurusan);
      _prodiController = TextEditingController(text: _prodi);
      _tahunLulusController = TextEditingController(text: _tahunLulus);
    });
  }

  _updatePendidikan() {
    AuthServices.updatePendidikan(
            _idUser.toString(),
            _universitasController.text,
            _jurusanController.text,
            _prodiController.text,
            _tahunLulusController.text)
        .then((value) {
      setState(() {
        if (value.kode == 1) {
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
    _getPendidikanSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "editpendidikan".tr,
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
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "universitas".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _universitasController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Politeknik Negeri Jember",
                ),
              ),
              Text(
                "jurusan".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _jurusanController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Teknologi Informasi",
                ),
              ),
              Text(
                "prodi".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _prodiController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Teknik Informatika",
                ),
              ),
              Text(
                "tahun".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _tahunLulusController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "2024",
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
                      onPressed: () {
                        _updatePendidikan();
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
