import 'package:d_view/d_view.dart';
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
              Expanded(
                child: ListView(
                  children: [
                    _buildPengeluaranHariIni(),
                    DView.spaceHeight(30),
                    Center(
                      child: Container(
                        height: 6,
                        width: 72,
                        decoration: BoxDecoration(
                          color: AppColor.lev3,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset(
          AppAsset.profile,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi,',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColor.lev1,
                ),
              ),
              Obx(
                () => Text(
                  controllerUser.data.name ?? '',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColor.lev1,
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

  Widget _buildPengeluaranHariIni() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
            'Pengeluaran Hari Ini',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.lev1,
            ),
          ),
        ),
        DView.spaceHeight(),
        _buildCardToday()
      ],
    );
  }

  Widget _buildCardToday() {
    return Material(
      color: AppColor.lev1,
      borderRadius: BorderRadius.circular(14),
      elevation: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
            child: Text(
              'Rp. 500.000.00',
              style: GoogleFonts.poppins(
                color: AppColor.lev4,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: Text(
              '20% dibanding kemarin',
              style: GoogleFonts.poppins(
                color: AppColor.lev4,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Selengkapnya',
                  style: GoogleFonts.poppins(
                    color: AppColor.lev1,
                    fontSize: 16,
                  ),
                ),
                const Icon(
                  Icons.navigate_next,
                  color: AppColor.lev1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
