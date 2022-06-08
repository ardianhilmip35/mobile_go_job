import 'package:flutter/material.dart';
import 'package:mobile_go_job/Screens/dashboard.dart';
import 'package:mobile_go_job/Screens/lowongan_pekerjaan.dart';
import 'package:mobile_go_job/Screens/profil.dart';
import 'package:mobile_go_job/Screens/simpan_lowongan.dart';
import 'package:mobile_go_job/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  PageController pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;
  bool isAuth = false;
  
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

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
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