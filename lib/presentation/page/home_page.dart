import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  void initState() {
    super.initState();
    homeController.getAnalysis(userController.data.idUser!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: homeWidget.drawerBuilder(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            children: [
              homeWidget.buildHeader(),
              // Content
              Expanded(
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
