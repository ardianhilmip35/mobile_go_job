import 'dart:convert';

import 'package:mobile_go_job/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_go_job/models/lowongan_model.dart';

import '../models/login_model.dart';
import '../models/profil_model.dart';


class AuthServices {
  var token;

  // String get body => null;
  static Object? data;
  var body = jsonEncode(data);

  
  
  //register
  static Future<http.Response> register(

    String nama_pelamar, String email, String password) async {
    Map data = {
      "nama_pelamar": nama_pelamar,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

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
    // print(response.body);
    // return response;
  }
  
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
    // var response = await http.post(Uri.parse(profilURL),
    //   body: {
    //     "id": id,
    //   },);

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
  
  static Future<List<Lowongan>> geLowongan() async {    
    
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
  
}
