import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pencatatan_keuangan/config/app_color.dart';
import 'package:pencatatan_keuangan/config/app_format.dart';
import 'package:pencatatan_keuangan/presentation/controller/controller_user.dart';
import 'package:pencatatan_keuangan/presentation/controller/history/controller_income_outcome.dart';

class IncomeOutcomePage extends StatefulWidget {
  const IncomeOutcomePage({super.key, required this.type});

  final String type;

  @override
  State<IncomeOutcomePage> createState() => _IncomeOutcomePageState();
}

class _IncomeOutcomePageState extends State<IncomeOutcomePage> {
  final incomeOutcomeController = Get.put(IncomeOutcomeController());
  final userController = Get.put(UserController());

  refresh() {
    incomeOutcomeController.getList(userController.data.idUser, widget.type);
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int item = 15;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            // Title
            Text(
              widget.type,
              style: GoogleFonts.poppins(),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 40,
                child: TextField(
                  onTap: () {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColor.lev3.withOpacity(0.5),
                    isDense: false,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 20,
                    ),
                    hintText: 'Tanggal',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  style: GoogleFonts.poppins(color: Colors.white),
                  cursorColor: Colors.white,
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
            ),
          ],
        ),
      ),
      // Content body
      body: ListView.builder(
        // padding: EdgeInsets.all(16),
        itemCount: item,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8,
            margin: EdgeInsets.fromLTRB(
              20,
              index == 0 ? 16 : 8,
              20,
              index == item - 1 ? 16 : 8,
            ),
            child: InkWell(
              onTap: () {
                // TODO: create action here
              },
              borderRadius: BorderRadius.circular(4),
              child: Row(
                children: [
                  DView.spaceWidth(),
                  Text(
                    AppFormat.date('2023-08-10'),
                    style: GoogleFonts.poppins(
                      color: AppColor.lev1,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Rp. 2000.000',
                      style: GoogleFonts.poppins(
                        color: AppColor.lev3,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  PopupMenuButton<String>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'update',
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Update',
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            const Icon(
                              Icons.update,
                              color: Color(0xff83D290),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Delete',
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            const Icon(
                              Icons.delete_forever,
                              color: Color(0XFFFF7171),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (value) {},
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
