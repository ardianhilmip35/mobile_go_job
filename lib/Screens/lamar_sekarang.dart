import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_go_job/Notifikasi/toast.dart';
import 'package:mobile_go_job/Screens/profil.dart';
import 'package:mobile_go_job/Screens/profil_perusahaan.dart';
import 'package:mobile_go_job/Services/auth_services.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_go_job/models/lowongan_model.dart';
import 'package:flutter/services.dart';

class LamarSekarang extends StatefulWidget {
  const LamarSekarang({Key? key}) : super(key: key);

  @override
  State<LamarSekarang> createState() => _LamarSekarangState();
}

class _LamarSekarangState extends State<LamarSekarang> {
  String? _fileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double nilaiSlider = 1;
  final _toast = ShowToast();
  // String? _namaPelamar, _email;

  String _namaPerusahaan = "",
      _alamatPerusahaan = "",
      _gaji = "",
      //lowongan
      _idLowongan = "",
      _namaLowongan = "",
      _deskripsiLamaran = "",
      //user
      _idUser = "";

  final _pengalamanController = TextEditingController();
  final _portofolioController = TextEditingController();

  // final _imgBaseUrl = Url.imageBaseUrl;

  _getSessionLamaran() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.getString("pelamar_id").toString();
      pref.getString("lowongan_id").toString();
      pref.getString("deskripsi_lamaran").toString();
      pref.getString("portofolio_pelamar").toString();
    });
  }

  _getSessionLowongan() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _namaPerusahaan = pref.getString("namaperusahaan").toString();
      _namaLowongan = pref.getString("namalowongan").toString();
      _alamatPerusahaan = pref.getString("alamatperusahaan").toString();
      _gaji = pref.getString("gajipekerjaan").toString();
    });
  }

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.getString("id") ?? "";
    AuthServices.getUser(idUser).then((value) {
      if (mounted) {
        setState(() {
          idUser = idUser;
          // _idLowongan = idLowongan;
          // _namaPelamar = value.namaPelamar;
        });
      }
    });
  }

  _lamaran() {
    AuthServices.lamar(
            _idUser,
            _idLowongan,
            _pengalamanController.text.trim().toLowerCase(),
            _deskripsiLamaran,
            _portofolioController.text.trim().toLowerCase()
            )
        .then((value) {
      setState(() {
        if (value.kode == 201) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Profil()));
        } else {
          _toast.showToast(value.pesan);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getSessionLowongan();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lamarsekarang'.tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
        leading: IconButton(
          //untuk back button
          iconSize: 25,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                      padding: EdgeInsets.all(3),
                      height: 125,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 219, 217, 217)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(2),
                          ),
                          Text(
                            // "Web Development Staff",
                            // _namaLowongan.toString(),
                            "$_namaLowongan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: primarycolor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.centerLeft,
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        // "PT Patma Tirta Jaya",
                                        // _namaPerusahaan.toString(),
                                        "$_namaPerusahaan",
                                        style: TextStyle(
                                            fontSize: 15, color: primarycolor),
                                      ),
                                    ],
                                  )),
                              Container(
                                  alignment: Alignment.centerRight,
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      MaterialButton(
                                        textColor: primarycolor,
                                        child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.navigate_next)
                                            ]),
                                        onPressed: () {
                                          Route route = MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfilPerusahaan());
                                          Navigator.push(context, route);
                                          // if (_formKey.currentState!
                                          //     .validate()) {}
                                        },
                                        splashColor: Colors.transparent,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          // Padding (padding: EdgeInsets.all(7),),
                          // Text(
                          //   "PT Patma Tirta Jaya",
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //     color: primarycolor),
                          // ),
                          Padding(padding: EdgeInsets.only(bottom: 15)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.centerLeft,
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        // "Surabaya, Jawa Timur"
                                        _alamatPerusahaan.toString(),
                                      ),
                                    ],
                                  )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        // "5 Hari Yang Lalu"
                                        _gaji.toString(),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                child: Column(
                  children: <Widget>[
                    // Container(
                    //   padding: EdgeInsets.only(left: 5),
                    //   height: 75,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       color: Color.fromARGB(255, 219, 217, 217)),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: <Widget>[
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: <Widget>[
                    //           Container(
                    //               width:
                    //                   MediaQuery.of(context).size.width / 2.2,
                    //               child: Text(
                    //                 // "Tanti Wulansari",
                    //                 "$_namaPelamar",
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 15,
                    //                     color: primarycolor),
                    //               )),
                    //           Container(
                    //               alignment: Alignment.centerRight,
                    //               width:
                    //                   MediaQuery.of(context).size.width / 2.2,
                    //               child: MaterialButton(
                    //                 textColor: primarycolor,
                    //                 child: Text(
                    //                   'lihat'.tr,
                    //                   style: TextStyle(
                    //                     fontSize: 15.0,
                    //                   ),
                    //                 ),
                    //                 onPressed: () {
                    //                   Route route = MaterialPageRoute(
                    //                       builder: (context) => Profil());
                    //                   Navigator.push(context, route);
                    //                   // if (_formKey.currentState!.validate()) {}
                    //                 },
                    //                 splashColor: Colors.transparent,
                    //               )),
                    //         ],
                    //       ),
                    //       // Padding (padding: EdgeInsets.all(3),),
                    //       // Text(
                    //       //   "Tanti Wulansari",
                    //       //   style: TextStyle(
                    //       //     fontWeight: FontWeight.bold,
                    //       //     fontSize: 20,
                    //       //     color: primarycolor),
                    //       // ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: <Widget>[
                    //           Container(
                    //               alignment: Alignment.centerLeft,
                    //               width:
                    //                   MediaQuery.of(context).size.width / 2.2,
                    //               child: Text("087784666329")),
                    //           Container(
                    //               alignment: Alignment.centerRight,
                    //               width:
                    //                   MediaQuery.of(context).size.width / 2.2,
                    //               child: Text(
                    //                 // "tantiwulansari@gmail.com"
                    //                 "$_email",
                    //               )),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              TextFormField(
                controller: _pengalamanController,
                maxLines: 5,
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                    hintText: "informasipengalaman".tr,
                    border: OutlineInputBorder(),
                    focusColor: Colors.grey,
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      constraints: BoxConstraints(maxHeight: double.infinity),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 219, 217, 217)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.centerLeft,
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  child: Text(
                                    "Curiculum Vitae",
                                    style: TextStyle(
                                        
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: primarycolor),
                                  )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  alignment: Alignment.centerRight,
                                  child: MaterialButton(
                                    height: 40.0,
                                    minWidth: 100.0,
                                    color: primarycolor,
                                    textColor: Colors.white,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'pilihfile'.tr,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Icon(Icons.drive_folder_upload_outlined),
                                          SizedBox(width: 12),
                                        ]),
                                    onPressed: () => _openFileExplorer(),
                                    splashColor: Colors.transparent,
                                  )),
                            ],
                          ),
                          Builder(
                            builder: (BuildContext context) => _loadingPath
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: const CircularProgressIndicator(),
                                  )
                                : _directoryPath != null
                                    ? ListTile(
                                        title: const Text('Directory path'),
                                        subtitle: Text(_directoryPath!),
                                      )
                                    : _paths != null
                                        ? Container(
                                        
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.10,
                                            child: Scrollbar(
                                                child: ListView.separated(
                                              itemCount: _paths != null &&
                                                      _paths!.isNotEmpty
                                                  ? _paths!.length
                                                  : 1,
                                              itemBuilder:
                                          
                                                  (BuildContext context,
                                                      int index) {
                                                final bool isMultiPath =
                                                    _paths != null &&
                                                        _paths!.isNotEmpty;
                                                final String name =
                                                    'File $index: ' +
                                                        (isMultiPath
                                                            ? _paths!
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList()[index]
                                                            : _fileName ??
                                                                '...');
                                                final path = _paths!
                                                    .map((e) => e.path)
                                                    .toList()[index]
                                                    .toString();

                                                return ListTile(
                                                  title: Text(
                                                    name,
                                                  ),
                                                  subtitle: Text(path),
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      const Divider(),
                                            )),
                                          )
                                        : const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 17)),
                    MaterialButton(
                      height: 40.0,
                      minWidth: 100.0,
                      color: primarycolor,
                      textColor: Colors.white,
                      child: new Text(
                        'kirimlamaran'.tr,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      onPressed: () {
                        _lamaran();
                      },
                      splashColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      print(_paths!.first.extension);
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
    });
  }
}
