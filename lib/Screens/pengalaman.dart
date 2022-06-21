import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/view_profil.dart';
import 'package:mobile_go_job/Services/auth_services.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Notifikasi/alert.dart';

class Pengalaman extends StatefulWidget {
  const Pengalaman({Key? key}) : super(key: key);

  @override
  State<Pengalaman> createState() => _PengalamanState();
}

class _PengalamanState extends State<Pengalaman> {
  String? _idUser;

  final _formKey = GlobalKey<FormState>();
  final _alert = ShowAlert();

  var _pengalamanController = TextEditingController();
  var _posisiController = TextEditingController();
  var _perusahaanController = TextEditingController();
  var _spesialisController = TextEditingController();
  var _lokasiController = TextEditingController();
  var _gajiController = TextEditingController();

  _getPengalamanSession() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _idUser = prefs.getString('id').toString();
      String? _pengalaman = prefs.getString('pengalaman').toString();
      String? _posisi = prefs.getString('posisi').toString();
      String? _perusahaan = prefs.getString('perusahaan').toString();
      String? _spesialis = prefs.getString('spesialis').toString();
      String? _lokasi = prefs.getString('lokasi').toString();
      String? _gaji = prefs.getString('gaji').toString();

      _pengalamanController = TextEditingController(text: _pengalaman);
      _posisiController = TextEditingController(text: _posisi);
      _perusahaanController = TextEditingController(text: _perusahaan);
      _spesialisController = TextEditingController(text: _spesialis);
      _lokasiController = TextEditingController(text: _lokasi);
      _gajiController = TextEditingController(text: _gaji);
    });
  }

  _updatePengalaman() {
    AuthServices.updatePengalaman(
            _idUser.toString(),
            _pengalamanController.text,
            _posisiController.text,
            _perusahaanController.text,
            _spesialisController.text,
            _lokasiController.text,
            _gajiController.text)
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
    _getPengalamanSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Pengalaman".tr,
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
                "Pengalaman Kerja".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextFormField(
                maxLines: 5,
                controller: _pengalamanController,
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                    hintText: "Pengalaman",
                    border: OutlineInputBorder(),
                    focusColor: Colors.grey,
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
              ),
              Text(
                "Posisi Sebelumnya".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _posisiController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "manajer",
                ),
              ),
              Text(
                "Pernah Bekerja di".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _perusahaanController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "alfamart",
                ),
              ),
              Text(
                "Spesialis".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _spesialisController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "-",
                ),
              ),
              Text(
                "Lokasi Kerja Sebelumnya".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _lokasiController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Jakarta",
                ),
              ),
              Text(
                "Gaji".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _gajiController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Rp. 1.000.000",
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
                        "Simpan".tr,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        _updatePengalaman();
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
                        "Batal".tr,
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
