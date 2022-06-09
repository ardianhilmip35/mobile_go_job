import 'dart:convert';

import 'package:mobile_go_job/Services/globals.dart';
import 'package:http/http.dart' as http;
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
  
   profil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('id');
    Map data = {
      "id" : id
    };
    var body = json.encode(data);
    var url = Uri.parse(profilURL);
    http.Response response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $id',
      },
      body: body,
    );
    print(jsonDecode(response.body));
    return response;
  }

  // Future<http.Response> 

  // getUserData() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var id = preferences.getInt('id');
  //   var requsest = await http.get(Uri.parse("$profilURL"), headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     });
  //   var body = jsonDecode(requsest.body);
  //   return requsest;
  // }
  
  // Future _getToken() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   token = jsonDecode(localStorage.getString('token'))['token'];
  // }

  

}
