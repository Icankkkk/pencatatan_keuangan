import 'package:d_info/d_info.dart';
import 'package:d_method/d_method.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pencatatan_keuangan/config/app_request.dart';
import 'package:pencatatan_keuangan/data/model/history.dart';

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

  static Future<bool> add(
    String idUser,
    String date,
    String type,
    String details,
    String total,
  ) async {
    String url = '${Api.history}/add.php';
    Map? responseBody = await AppRequest.post(url, {
      'id_user': idUser,
      'date': date,
      'type': type,
      'details': details,
      'total': total,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });

    if (responseBody == null) return false;

    if (responseBody['success']) {
      DInfo.dialogSuccess('Berhasil tambah history',
          messageStyle: GoogleFonts.poppins());
      DInfo.closeDialog();
    } else {
      if (responseBody['message'] == 'date') {
        DInfo.dialogError(
          'History dengan tanggal tersebut sudah pernah dibuat',
          messageStyle: GoogleFonts.poppins(),
        );
      } else {
        DInfo.dialogError(
          'Gagal tambah history',
          messageStyle: GoogleFonts.poppins(),
        );
      }
      DInfo.closeDialog();
    }

    return responseBody['success'];
  }

  static Future<List<History>> incomeOutcome(String idUser, String type) async {
    String url = '${Api.history}/income_outcome.php';
    Map? responseBody =
        await AppRequest.post(url, {'id_user': idUser, 'type': type});

    if (responseBody == null) return [];

    if (responseBody['success']) {
      List list = responseBody['data'];
      return list.map((e) => History.fromJson(e)).toList();
    }

    return [];
  }
}
