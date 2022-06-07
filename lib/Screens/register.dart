import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_go_job/Services/auth_services.dart';
import 'package:mobile_go_job/Services/globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_go_job/shared/shared.dart';

import '../rounded_button.dart';
import 'dashboard.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email = '';
  String _password = '';
  String _namaPelamar = '';

  createAccountPressed() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response =
          await AuthServices.register(_namaPelamar, _email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const Dashboard(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
      ),
      body: SingleChildScrollView(
        child: Form(
          // key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.8),
                  child: Image.asset(
                    //untuk logo image
                    'assets/images/logo1.png',
                    height: 150,
                    width: 200,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.8, left: 8.8, right: 8.8),
                  child: TextFormField(
                    // controller: namaPelamar,
                    //untuk input email
                    decoration: new InputDecoration(
                      labelText: "Nama",
                      icon: Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0)),
                    ),
                    onChanged: (value) {
                      _namaPelamar = value;
                    },
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'namakosong'.tr;
                    //   }
                    //   // name = namaValue;
                    //   // return null;
                    // },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25, left: 8.8, right: 8.8),
                  child: TextFormField(
                    // controller: email,
                    //untuk input email
                    decoration: new InputDecoration(
                      labelText: "Email",
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0)),
                    ),
                    onChanged: (value) {
                      _email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'emailkosong';
                      }
                      // email = emailValue;
                      // return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25, left: 8.8, right: 8.8),
                  child: TextFormField(
                    // controller: password,
                    //untuk textfield password
                    obscureText: true,
                    decoration: new InputDecoration(
                      labelText: "Password",
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0)),
                    ),
                    onChanged: (value) {
                      _password = value;
                    },
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'sandikosong'.tr;
                    //   }
                    //   // password = passwordValue;
                    //   // return null;
                    // },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25, left: 8.8, right: 8.8),
                  child: TextFormField(
                    //untuk textfield password
                    obscureText: true,
                    decoration: new InputDecoration(
                      labelText: "Konfirmasi Password",
                      icon: Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "konfir kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                SizedBox(
                  width: 210,
                  // child: RoundedButton(
                  //   btnText: 'Register',
                  //   onBtnPressed: () => createAccountPressed(),
                  //   ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primarycolor,
                    ),
                    onPressed: () => createAccountPressed(),
                    child: Text(
                      'Register',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                      // if (_formKey.currentState!.validate()) {
                      //   _register();
                      // },
                    
                    // child: Text(
                    //   'daftar'.tr,
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: new Text(
                    //untuk text or
                    "atau",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 210,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: primarycolor,
                    ),
                    onPressed: () {
                      // controller.login();
                    },
                    icon: Icon(
                      // <-- Icon
                      Icons.login,
                      size: 24.0,
                    ),
                    label: Text(
                      'Daftar Google',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Sudah Punya Akun? ',
                              style: TextStyle(color: Colors.grey)),
                          WidgetSpan(
                              child: GestureDetector(
                            child: Text(
                              'Masuk',
                              style: TextStyle(color: primarycolor),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                          ))
                        ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}