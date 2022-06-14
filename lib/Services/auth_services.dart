import 'dart:convert';

import 'package:mobile_go_job/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_go_job/models/lowongan_model.dart';


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
  static login (String _email, String password) async {

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
    print(response.body);
    return response;
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
  profil() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getInt('id');
    var request = await http.get(Uri.parse("$profilURL/$id"), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    // var body = jsonDecode(request.body);
    return request;
  }
  
  // Future _getToken() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   token = jsonDecode(localStorage.getString('token'))['token'];
  // }

  //lihat data lowongan
  //  Future<List<Lowongan>> getAllProducts() async {
  //   try {
  //     final response = await http.get(Uri.parse("$baseURL/products"));
  //     if (response.statusCode == 200) {
  //       List<dynamic> json = jsonDecode(response.body);
  //       return List<Lowongan>.from(json.map((e) => Lowongan.fromJson(e)));
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }
  // Future<List<Lowongan>> getBestSeller() async {
  //   try {
  //     final response =
  //         await http.get(Uri.parse("$baseURL/products/bestseller"));
  //     if (response.statusCode == 200) {
  //       List<dynamic> json = jsonDecode(response.body);
  //       return List<Lowongan>.from(json.map((e) => Lowongan.fromJson(e)));
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }

  

}
