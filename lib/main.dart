import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pencatatan_keuangan/config/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Scaffold(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: AppColor.lev1,
        colorScheme: const ColorScheme.light(
          primary: AppColor.lev1,
          secondary: AppColor.lev2,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.lev1,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
