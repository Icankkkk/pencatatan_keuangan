import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pencatatan_keuangan/config/app_color.dart';
import 'package:pencatatan_keuangan/presentation/controller/controller_home.dart';
import 'package:pencatatan_keuangan/presentation/controller/controller_user.dart';
import 'package:pencatatan_keuangan/presentation/widget/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userController = Get.put(UserController());
  final homeController = Get.put(HomeController());
  final homeWidget = Get.put(HomeWidget());

  refresh() {
    homeController.getAnalysis(userController.data.idUser!);
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: homeWidget.drawerBuilder(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.lev1,
          ),
          child: GNav(
            // TODO: Clear GNap...
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            color: Colors.white,
            activeColor: AppColor.lev4,
            textStyle: GoogleFonts.poppins(color: AppColor.lev4),
            padding: const EdgeInsets.all(16),
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Pengaturan',
              ),
              GButton(
                icon: Icons.history_rounded,
                text: 'Riwayat',
              ),
              GButton(
                icon: Icons.logout_rounded,
                text: 'Keluar',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              homeWidget.buildHeader(),
              // Content
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    refresh();
                  },
                  child: ListView(
                    children: [
                      homeWidget.buildTodayExpenses(),
                      DView.spaceHeight(30),
                      Center(
                        child: myDivider(),
                      ),
                      homeWidget.buildWeeklyExpenses(),
                      DView.spaceHeight(16),
                      homeWidget.buildMonthlyComparison(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container myDivider() {
    return Container(
      height: 6,
      width: 72,
      decoration: BoxDecoration(
        color: AppColor.lev3,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
