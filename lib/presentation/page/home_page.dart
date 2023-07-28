import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pencatatan_keuangan/config/app_asset.dart';
import 'package:pencatatan_keuangan/config/app_color.dart';
import 'package:pencatatan_keuangan/data/controller_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controllerUser = Get.put(ControllerUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(child: ListView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset(AppAsset.profile),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi,',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Obx(
                () => Text(
                  controllerUser.data.name ?? '',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildMenuButton(context),
      ],
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(4),
      color: AppColor.lev3,
      child: InkWell(
        onTap: () => Scaffold.of(context).openEndDrawer(),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.menu,
            color: AppColor.lev1,
          ),
        ),
      ),
    );
  }
}
