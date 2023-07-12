import 'package:intl/intl.dart';

class AppFormat {
  static String date(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    String dateFormat = DateFormat('d MMM yyyy', 'id_ID').format(dateTime);
    return dateFormat;
  }
}
