import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_go_job/Screens/profil.dart';
import 'package:mobile_go_job/Screens/register.dart';
import 'package:mobile_go_job/Services/auth_services.dart';
import 'package:mobile_go_job/Services/globals.dart';
import 'package:mobile_go_job/main.dart';
import 'package:mobile_go_job/rounded_button.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_go_job/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_go_job/Notifikasi/toast.dart';
import 'package:mobile_go_job/Notifikasi/alert.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  

  @override
  _LoginState createState() => _LoginState();

  // static login(String text, String text2) {}
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _toast = ShowToast();
  final _alert = ShowAlert();
  String _idUser = "";

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    AuthServices.login(_emailController.text, _passwordController.text)
        .then((value) {
      if (value.message == 'success') {
        _idUser = value.id.toString();
        sessionLogin();
        _toast.showToast(value.message);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyBottomBar(),
          ),
        );
      } else {
        _toast.showToast(value.message);
      }
    });
  }

  Future sessionLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("id", _idUser);
      pref.setBool("is_login", true);
    });
  }
  // String _email = '';
  // String _password = '';

  // loginPressed() async {
  //   if (_email.isNotEmpty && _password.isNotEmpty) {
  //     http.Response response = await AuthServices.login(_email, _password);
  //     Map responseMap = jsonDecode(response.body);
  //     // if (response==401) {
  //     //   errorSnackBar(context, responseMap.values.first);
  //     // } else {
  //       SharedPreferences preferences = await SharedPreferences.getInstance();
  //       // await preferences.setInt('id', jsonDecode(responseMap[id]));
  //       await preferences.setString('nama_pelamar', responseMap['nama_pelamar']);
  //       await preferences.setString('email', responseMap['email']);
  //       await preferences.setInt('id', responseMap['id']);
  //       Navigator.pushReplacement(
  //         context,
  //         new MaterialPageRoute(
  //           builder: (context) => MyBottomBar(),
  //         )
  //       );
  //     // }
  //   } else {
  //     errorSnackBar(context, 'enter all required fields');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
          "Login",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primarycolor,
      ),
        body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Image.asset(
                    //untuk logo image
                    'assets/images/logo1.png',
                    height: 150,
                    width: 200,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 8.8, right: 8.8),
                  child: TextFormField(
                    //untuk input email
                    // onSaved: (value) => requestModel.email = value,
                    controller: _emailController,
                    decoration: new InputDecoration(
                      labelText: "Email",
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0)),
                    ),
                    // onChanged: (value) {
                    //   _email = value;
                    // },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'emailkosong'.tr;
                      }
                      // email = value;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 8.8, right: 8.8),
                  child: TextFormField(
                    //untuk textfield password
                    controller: _passwordController,
                    // onSaved: (value) => requestModel.password = value,
                    obscureText: true,
                    decoration: new InputDecoration(
                      labelText: "sandi".tr,
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0)),
                    ),
                    // onChanged: (value) {
                    //   _password = value;
                    // },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'sandikosong'.tr;
                      }
                      // password = passwordValue;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                SizedBox(
                  width: 210,
                  child: ElevatedButton(
                    child: Text(
                      'masuk'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: primarycolor,
                    ),
                    // onPressed: () => loginPressed(),
                    onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _login();
                                  }
                                },
                      // if (_formKey.currentState!.validate()) {
                      //   _login();
                      // }
                      // if(_formKey.currentState.validate()) {
                      //   _login();
                      // }
                    // },
                    // setState(() {
                    //   visible = true;
                    // });
                    // signIn(emailController.text, passwordController.text);

                    // },
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: new Text(
                    //untuk text or
                    "atau".tr,
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
                      Icons.login,
                      size: 24.0,
                    ),
                    label: Text(
                      'masukgoogle'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'belumpunyaakun'.tr,
                              style: TextStyle(color: Colors.grey)),
                          WidgetSpan(
                              child: GestureDetector(
                            child: Text(
                              'daftar'.tr,
                              style: TextStyle(color: primarycolor),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()),
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