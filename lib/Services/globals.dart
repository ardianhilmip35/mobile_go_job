import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseURL = "http://127.0.0.1:8000/api/register";
final String profilURL = "http://127.0.0.1:8000/api/profile";
const String loginURL = "http://127.0.0.1:8000/api/login"; //emulator localhost
const String lowonganURL = "http://127.0.0.1:8000/api/lowongan/lihat"; //emulator localhost

const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}