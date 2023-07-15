import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pencatatan_keuangan/config/session.dart';
import 'package:pencatatan_keuangan/presentation/page/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            IconButton(
              onPressed: () {
                Session.clearUser();
                Get.off(() => const LoginPage());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
