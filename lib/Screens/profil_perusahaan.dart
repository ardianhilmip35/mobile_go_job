import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/detail_lowongan.dart';
import 'package:mobile_go_job/Screens/profil.dart';
import 'package:mobile_go_job/Services/auth_services.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/lowongan_model.dart';

class ProfilPerusahaan extends StatefulWidget {
  const ProfilPerusahaan({Key? key}) : super(key: key);

  @override
  State<ProfilPerusahaan> createState() => _ProfilPerusahaanState();
}

class _ProfilPerusahaanState extends State<ProfilPerusahaan> {

  // int _index = 0;
  // List<Lowongan> _lowongan = [];

  // _getData() async {
  //   _lowongan = await AuthServices.getLowongan();
  //   if (mounted) {
  //     setState(() {
  //       _lowongan;
  //     });
  //   }
  // }

  // Future<void> sessionDetailLowongan() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     pref.setString("id", _lowongan[_index].id.toString());
  //     // pref.setString("logo", _lowongan[_index].logo.toString());
  //     // pref.setString("namalowongan", _lowongan[_index].namalowongan.toString());
  //     pref.setString("namaperusahaan", _lowongan[_index].namaperusahaan.toString());
  //     pref.setString("alamatperusahaan", _lowongan[_index].alamatperusahaan.toString());
  //     pref.setString("deskripsiperusahaan", _lowongan[_index].deskripsiperusahaan.toString());
  //     // pref.setString("gajipekerjaan", _lowongan[_index].gajipekerjaan.toString());
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _getData();
  // }

  String? _fileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  final _formKey = GlobalKey<FormState>();
  double nilaiSlider = 1;

  String _namaPerusahaan = "",
      _alamatPerusahaan = "",
      _deskripsiPerusahaan = "";

  // final _imgBaseUrl = Url.imageBaseUrl;

  _getSessionLowongan() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _namaPerusahaan = pref.getString("namaperusahaan").toString();
      _alamatPerusahaan = pref.getString("alamatperusahaan").toString();
      _deskripsiPerusahaan = pref.getString("deskripsiperusahaan").toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _getSessionLowongan();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'detailperusahaan'.tr,
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 8.0),
        child: Column(
          children: [
            // TextFormField(
            //   textInputAction: TextInputAction.search,
            //   style: Theme.of(context).textTheme.bodyText1,
            //   decoration: InputDecoration(
            //       labelText: "caripekerjaan".tr,
            //       border: OutlineInputBorder(),
            //       focusColor: Colors.grey,
            //       labelStyle:
            //           TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            //       prefixIcon: Icon(
            //         Icons.search,
            //       )),
            // ),
            Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: primarycolor, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: MaterialButton(
                            child: Text(
                              'pekerjaan'.tr,
                              style:
                                  TextStyle(fontSize: 20, color: primarycolor),
                            ),
                            onPressed: () {
                              Route route =
                                  MaterialPageRoute(builder: (context) => DetailLowongan());
                              Navigator.push(context, route);
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: MaterialButton(
                            child: Text(
                              'perusahaan'.tr,
                              style:
                                  TextStyle(fontSize: 20, color: primarycolor),
                            ),
                            onPressed: () {
                              Route route =
                                  MaterialPageRoute(builder: (context) => ProfilPerusahaan());
                              Navigator.push(context, route);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
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
                  // "PT Patma Tirta Jaya",
                  _namaPerusahaan.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: primarycolor),
                ),
                Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 50)),
                          Text(
                            // "Surabaya, Jawa Timur",
                            _alamatPerusahaan.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: primarycolor),
                          ),
                        ]),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: EdgeInsets.all(15),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                _deskripsiPerusahaan.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: primarycolor),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
