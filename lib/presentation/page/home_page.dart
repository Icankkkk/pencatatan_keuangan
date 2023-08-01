import 'package:d_chart/d_chart.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pencatatan_keuangan/config/app_asset.dart';
import 'package:pencatatan_keuangan/config/app_color.dart';
import 'package:pencatatan_keuangan/config/session.dart';
import 'package:pencatatan_keuangan/presentation/controller/controller_user.dart';
import 'package:pencatatan_keuangan/presentation/page/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.only(bottom: 0),
              padding: const EdgeInsets.fromLTRB(20, 0, 16, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAsset.profile,
                        width: 70,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                userController.data.name ?? '',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Obx(
                              () => Text(
                                userController.data.email ?? '',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Logout
                  DView.spaceHeight(10),
                  ElevatedButton(
                    onPressed: () {
                      // clear session and going to login page.
                      Session.clearUser();
                      Get.off(() => const LoginPage());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 24,
                      ),
                      elevation: 6,
                      backgroundColor: AppColor.lev1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      'Keluar',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.add),
              horizontalTitleGap: 0,
              title: Text(
                'Tambah Baru',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              trailing: const Icon(Icons.navigate_next),
            ),
            const Divider(height: 0.5),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.south_west),
              horizontalTitleGap: 0,
              title: Text(
                'Pemasukan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              trailing: const Icon(Icons.navigate_next),
            ),
            const Divider(height: 0.5),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.north_east),
              horizontalTitleGap: 0,
              title: Text(
                'Pengeluaran',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              trailing: const Icon(Icons.navigate_next),
            ),
            const Divider(height: 0.5),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.history),
              horizontalTitleGap: 0,
              title: Text(
                'Riwayat',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              trailing: const Icon(Icons.navigate_next),
            ),
            const Divider(height: 0.5),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            children: [
              _buildHeader(),
              // Content
              Expanded(
                child: ListView(
                  children: [
                    _buildTodayExpenses(),
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
                    _buildWeeklyExpenses(),
                    DView.spaceHeight(16),
                    _buildMonthlyComparison(context),
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
          width: 70,
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
                  userController.data.name ?? '',
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

        // Menu button
        Builder(builder: (drawer) {
          return Material(
            borderRadius: BorderRadius.circular(4),
            color: AppColor.lev3,
            child: InkWell(
              onTap: () => Scaffold.of(drawer).openEndDrawer(),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.menu,
                  color: AppColor.lev1,
                ),
              ),
            ),
          );
        })
      ],
    );
  }

  Widget _buildTodayExpenses() {
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

  Widget _buildWeeklyExpenses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
            'Pengeluaran Minggu Ini',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.lev1,
            ),
          ),
        ),
        DView.spaceHeight(),
        _buildChartWeekly()
      ],
    );
  }

  Widget _buildChartWeekly() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DChartBar(
        data: const [
          {
            'id': 'Bar',
            'data': [
              {'domain': '2020', 'measure': 3},
              {'domain': '2021', 'measure': 4},
              {'domain': '2022', 'measure': 6},
              {'domain': '2023', 'measure': 5},
              {'domain': '2024', 'measure': 7},
            ],
          },
        ],
        domainLabelPaddingToAxisLine: 16,
        axisLineTick: 1,
        axisLinePointTick: 1,
        axisLinePointWidth: 8,
        axisLineColor: AppColor.lev1,
        measureLabelPaddingToAxisLine: 16,
        barColor: (barData, index, id) => AppColor.lev1,
        showBarValue: true,
      ),
    );
  }

  Widget _buildMonthlyComparison(BuildContext ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
            'Perbandingan Bulan Ini',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.lev1,
            ),
          ),
        ),
        DView.spaceHeight(),
        _buildMonthlyChart(ctx)
      ],
    );
  }

  Widget _buildMonthlyChart(BuildContext ctx) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(ctx).size.width * 0.5,
          height: MediaQuery.of(ctx).size.width * 0.5,
          child: Stack(
            children: [
              DChartPie(
                data: const [
                  {'domain': 'Flutter', 'measure': 28},
                  {'domain': 'React Native', 'measure': 40},
                ],
                fillColor: (pieData, index) => AppColor.lev1,
                donutWidth: 28,
                labelColor: Colors.white,
              ),
              // Percentage
              Center(
                child: Text(
                  '70%',
                  style: GoogleFonts.poppins(
                    color: AppColor.lev3,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        DView.spaceWidth(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 16,
                  width: 16,
                  color: AppColor.lev1,
                ),
                DView.spaceWidth(8),
                Text(
                  'Pemasukan',
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 16,
                  width: 16,
                  color: AppColor.lev3,
                ),
                DView.spaceWidth(8),
                Text(
                  'Pengeluaran',
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            DView.spaceHeight(10),
            Text(
              'Pemasukan lebih \nbesar 20% dari \nPengeluaran',
              style: GoogleFonts.poppins(),
            ),
            DView.spaceHeight(10),
            Text(
              'Atau setara',
              style: GoogleFonts.poppins(),
            ),
            Text(
              'Rp 20.000,00',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColor.lev1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
