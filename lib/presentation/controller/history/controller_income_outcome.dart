import 'package:get/get.dart';
import 'package:pencatatan_keuangan/data/model/history.dart';
import 'package:pencatatan_keuangan/data/source/source_history.dart';

class IncomeOutcomeController extends GetxController {
  final _list = <History>[].obs;
  List<History> get list => _list;

  getList(idUser, type) async {
    _list.value = await SourceHistory.incomeOutcome(idUser, type);
    update();
  }
}
