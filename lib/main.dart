// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart'; // Import file navigasi kita

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Todo Project",
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      initialRoute: AppPages.initial, // Halaman pertama yang dibuka
      getPages: AppPages.routes, // Daftar semua halaman yang ada
    );
  }
}