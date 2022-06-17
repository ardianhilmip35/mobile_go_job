import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/login.dart';
import 'package:mobile_go_job/Screens/profil.dart';
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
    AuthServices.updatePelamar(_idUser.toString(), _namaController.text,
    _alamatController.text, _agamaController.text, _noHpController.text, _jnsKelaminController.text, _tglLahirController.text)
    .then((value) {
      setState(() {
        if (value.kode == 1) {
          _alert.coolAlertSucces(value.pesan, context, "OK");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profil()));
        } else {
          _alert.coolAlertFail(value.pesan, context, "OK");
        }
      });
    });
  }

  _logOut() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("is_login");
      pref.clear();
    });
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Login(),
      ),
      (route) => false,
    );
  }


  // _showDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text("Konfirmasi"),
  //         content: const Text("Apakah anda yakin ingin mengubah profil?"),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text("Tidak"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: const Text("Ya"),
  //             onPressed: () {
  //               _updateUser();
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _getUserSession();
  }

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
                controller: _namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "$_namaController",
                ),
              ),
              Text(
                "alamat".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _alamatController,
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
                controller: _agamaController,
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
                controller: _noHpController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "08972736134",
                ),
              ),
              Text(
                "Jenis Kelamin".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _jnsKelaminController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Laki - Laki",
                ),
              ),
              Text(
                "tanggallahir".tr,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
              TextField(
                controller: _tglLahirController,
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
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                          _updateUser();
                        // }

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
