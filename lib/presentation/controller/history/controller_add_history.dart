import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ControllerAddHistory extends GetxController {
  final _date = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  String get date => _date.value;
  setDate(n) => _date.value = n;

  final _type = 'Pemasukan'.obs;
  String get type => _type.value;
  setType(n) => _type.value = n;

  final _items = <dynamic>[].obs;
  List<dynamic> get items => _items.toList();
  void addItem(dynamic item) {
    _items.add(item);
    count();
  }

  void deleteItem(dynamic item) {
    _items.remove(item);
    count();
  }

  final _total = 0.0.obs;
  double get total => _total.value;

  void count() {
    _total.value = items
        .map<double>((e) => double.parse(e['price'].toString()))
        .toList()
        .fold(0.0, (previousValue, element) => previousValue + element);
    update();
  }
}
