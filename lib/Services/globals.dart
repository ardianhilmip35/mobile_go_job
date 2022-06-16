import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseURL = "https://ws-tif.com/kel24/api/register";

const String loginURL = "https://ws-tif.com/kel24/api/login"; //emulator localhost
const String lowonganURL = "https://ws-tif.com/kel24/api/lowongan/lihat"; //emulator localhost
final String logoURL = "https://ws-tif.com/kel24/uploads/logo/";
final String logoutURL = "https://ws-tif.com/kel24/logout"; //emulator localhost
 //emulator localhost

const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}