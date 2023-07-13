import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan/config/app_asset.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pencatatan_keuangan/config/app_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DView.nothing(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Image.asset(AppAsset.logo),
                    DView.spaceHeight(40),
                    // TEXT FIELD USERNAME
                    TextField(
                      controller: emailController,
                      cursorColor: Colors.white,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        fillColor: AppColor.lev1,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Your email',
                        hintStyle: GoogleFonts.poppins(color: Colors.white60),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                    ),
                    DView.spaceHeight(20),

                    // TEXT FIELD PASSWORD
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      cursorColor: Colors.white,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        fillColor: AppColor.lev1,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Your password',
                        hintStyle: GoogleFonts.poppins(color: Colors.white60),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // REGISTER
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun? ',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Register',
                        style: GoogleFonts.poppins(
                          color: AppColor.lev1,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
