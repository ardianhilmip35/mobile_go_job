import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/dashboard.dart';
import 'package:mobile_go_job/Screens/login.dart';
import 'package:mobile_go_job/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  _SplashScreen createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen> {

  bool isAuth = false;
  _splashScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var id = prefs.getString('id');
    if (token != null && id != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    } else {
      setState(() {
        isAuth = false;
      });
    }
    
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      if (isAuth) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyBottomBar()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }

  void initState(){
    super.initState();
    _splashScreen();
  }

  // splashscreenStart() async{
  //   var duration = const Duration(seconds: 3);
  //   return Timer(duration, (){
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Login()),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset('assets/images/logo1.png', width: 200, height: 200,),
        )
      ),
    );
  }
}