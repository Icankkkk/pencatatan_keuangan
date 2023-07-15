import 'package:pencatatan_keuangan/config/api.dart';
import 'package:pencatatan_keuangan/config/app_request.dart';
import 'package:pencatatan_keuangan/config/session.dart';
import 'package:pencatatan_keuangan/data/model/user.dart';

class SourceUser {
  // login Method
  static Future<bool> login(String email, String password) async {
    String url = '${Api.user}/login.php';
    Map? responBody = await AppRequest.post(url, {
      'email': email,
      'password': password,
    });

    // Check Validasi
    if (responBody == null) return false;

    if (responBody['success']) {
      var mapUser = responBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }

    return responBody['success'];
  }

  // register method
  static Future register(String name, String email, String password) async {}
}
