import 'dart:convert';

import 'package:mobile_go_job/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_go_job/models/update_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_go_job/models/lowongan_model.dart';

import '../models/login_model.dart';
import '../models/profil_model.dart';
import '../models/register_model.dart';


class AuthServices {
  var token;

  // String get body => null;
  static Object? data;
  var body = jsonEncode(data);

  
  
  //register
  static Future<Register> register(
    String namaPelamar, String email, String password) async {
    // Uri _apiURL = Uri.parse("${Url.baseURL}register.php");
    final Uri registerURL =  Uri.parse("$baseURL");
    var response = await http.post(
      registerURL,
      body: {
        "nama_pelamar": namaPelamar,
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return Register.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create User");
    }
  }
    // Map data = {
    //   "nama_pelamar": nama_pelamar,
    //   "email": email,
    //   "password": password,
    // };
    // var body = json.encode(data);
    // var url = Uri.parse(baseURL);
    // http.Response response = await http.post(
    //   url,
    //   headers: headers,
    //   body: body,
    // );
    // print(response.body);
    // return response;

  //login 
  static Future<Login> login (String _email, String password) async {
    Map data = {
      "email": _email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(loginURL);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      return Login.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to login User");
    }
  } 

  // logout() async {
  //   var fullUrl = Uri.parse(loginURL + logoutURL);
  //   await () async {
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     token = jsonDecode("accessToken")['access_token'];
  //   }();
  //   return await http.get(
  //     fullUrl,
  //     headers: _setHeaders(),
  //   );
  // }

  // _setHeaders() => {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     };
  // Future<dynamic> profil() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var id = prefs.getInt('id');
  //   Map data = {
  //     "id": id
  //   };
  //   var body = json.encode(data);
  //   var url = Uri.parse(loginURL + "/" + id.toString());
  //   http.Response response = await http.post(
  //     url,
  //     headers: headers,
  //     body: body,
  //   );
  //   print(response.body);
  //   return response;
  // }

  // Future<http.Response> 

  //menampilkan profil
  static Future<Profil> getUser(String id) async {
    final Uri profilURL =  Uri.parse("https://ws-tif.com/kel24/api/profile");

    var response = await http.post(profilURL, body: {"id": id});

    if (response.statusCode == 200) {
      return Profil.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to read user");
    }
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var id = preferences.getString('id');
    // var request = await http.get(Uri.parse("$profilURL/$id"), headers: {
    //     'Content-type': 'application/json',
    //     'Accept': 'application/json',
    //     'Authorization': 'Bearer $token',
    //   });
    // // var body = jsonDecode(request.body);
    // return request;
  }
  
  static Future<List<Lowongan>> getLowongan() async {    
    
    var response = await http.get(Uri.parse("$lowonganURL"));
    var responseData = jsonDecode(response.body);

    if(response.statusCode == 200) {
      List<dynamic> listLowongan = (responseData as Map<String, dynamic>)['data'];

      List<Lowongan> lowongans = [];
      for (int i = 0; i < listLowongan.length; i++) {
        lowongans.add(Lowongan.fromJson(listLowongan[i]));
      } 
      return lowongans;
    } else {
      throw Exception("Failed to load wisata");
    }
      // print(json.decode(response.body));
      // return json.decode(response.body);
  }

  static Future<Update> updatePelamar(
    String idUser,
    namaPelamar,
    alamatPelamar,
    agama,
    noHp,
    kelamin,
    tglLahir,) async {
    
    Uri _apiURL = Uri.parse("$updateURL");

    var response = await http.post(
      _apiURL,
      body: {
        "id": idUser,
        "nama_pelamar": namaPelamar,
        "alamat_pelamar": alamatPelamar,
        "agama": agama,
        "telp_pelamar": noHp,
        "jenis_kelamin": kelamin,
        "tanggal_lahir": tglLahir,
      },
    );

    if (response.statusCode == 200) {
      return Update.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update User");
    }
  }
}
