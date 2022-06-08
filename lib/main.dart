import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_go_job/Screens/dashboard.dart';
import 'package:mobile_go_job/Screens/edit_profil.dart';
import 'package:mobile_go_job/Screens/login.dart';
import 'package:mobile_go_job/Screens/lowongan_pekerjaan.dart';
import 'package:mobile_go_job/Screens/profil.dart';
import 'package:mobile_go_job/Screens/register.dart';
import 'package:mobile_go_job/Screens/simpan_lowongan.dart';
import 'package:mobile_go_job/Screens/splascreen.dart';

import 'package:mobile_go_job/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomBar(),
    );
  }
}

class MyBottomBar extends StatefulWidget {
  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Dashboard(),
    LowonganPekerjaan(),
    SimpanLowongan(),
    Profil(),
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //untuk bottom navigation barl
        elevation: 30,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: primarycolor, size: 30),
        iconSize: 30,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
            ),
            label: 'Tersimpan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profil',
          ),
        ],
        onTap: onTappedBar,
        currentIndex: _currentIndex,
      ),
    );
  }
}

class CheckAuth extends StatefulWidget {

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null) {
      if(mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }
   
  Widget build(BuildContext context) {
    Widget child;
    if(isAuth) {
      child = Dashboard();
    } else {
      child = Login();
    }
    return Scaffold(
      body: child,
    );
  }
}