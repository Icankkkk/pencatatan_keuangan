import 'package:d_method/d_method.dart';
import 'package:intl/intl.dart';
import 'package:pencatatan_keuangan/config/app_request.dart';

import '../../config/api.dart';

class SourceHistory {
  static Future<Map> analysis(String idUser) async {
    String url = '${Api.history}/analysis.php';
    try {
      Map? responseBody = await AppRequest.post(url, {
        'id_user': idUser,
        'today': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      });
      return responseBody ??
          {
            'today': 0.0,
            'yesterday': 0.0,
            'week': [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
            'month': {
              'income': 0.0,
              'outcome': 0.0,
            }
          };
    } catch (e) {
      DMethod.printTitle('Catch', e.toString());
      return {};
    }
  }
}
