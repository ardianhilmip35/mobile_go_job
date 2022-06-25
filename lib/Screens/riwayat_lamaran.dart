import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_go_job/Notifikasi/toast.dart';
import 'package:mobile_go_job/Services/auth_services.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatLamaran extends StatefulWidget {
  const RiwayatLamaran({Key? key}) : super(key: key);

  @override
  State<RiwayatLamaran> createState() => _RiwayatLamaranState();
}

class _RiwayatLamaranState extends State<RiwayatLamaran> {
  final _toast = ShowToast();
  String _namaPerusahaan = "", _namaPekerjaan = "";
  String _pelamarId = "";
  String? _lowonganId, _deskripsiLamaran;

  _getRiwayat() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String pelamarId = preferences.getString("pelamar_id") ?? "";

    AuthServices.riwayat(pelamarId).then((value) {
      setState(() {
        _lowonganId = value.lowonganId;
        _deskripsiLamaran = value.deskripsiLamaran;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondarycolor,
      appBar: AppBar(
        title: Text(
          'history'.tr,
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
                    Text('$_deskripsiLamaran', style: GoogleFonts.poppins()),
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
