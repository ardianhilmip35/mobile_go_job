import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/login.dart';

class SplashScreen extends StatefulWidget {

  _SplashScreen createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen> {

  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

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