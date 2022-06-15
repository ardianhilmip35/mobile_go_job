import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseURL = "https://ws-tif.com/kel24/api/register";

const String loginURL = "https://ws-tif.com/kel24/api/login"; //emulator localhost
const String lowonganURL = "http://127.0.0.1:8000/api/lowongan/lihat"; //emulator localhost

const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}