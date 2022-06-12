import 'dart:convert';

import 'package:mobile_go_job/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthServices {
  var token;
  
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

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
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

  

}
