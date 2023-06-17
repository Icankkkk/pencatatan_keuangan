import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pencatatan_keuangan/config/app_color.dart';
import 'package:pencatatan_keuangan/config/session.dart';
import 'package:pencatatan_keuangan/data/model/user.dart';
import 'package:pencatatan_keuangan/presentation/page/home_page.dart';
import 'package:pencatatan_keuangan/presentation/page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: FutureBuilder(
        future: Session.getUser(),
        builder: (context, AsyncSnapshot<User> snapsot) {
          if (snapsot.data != null && snapsot.data!.idUser != null) {
            return const HomePage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
