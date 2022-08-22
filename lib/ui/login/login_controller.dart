import 'package:get/get.dart';
import 'package:loginexample/ui/login/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  final LoginRepo _repo = Get.find();

  Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();

    _repo.getUserData();

    if (username == await prefs.get("username") && password == await prefs.get("password")){
      return true;
    }else{
      return false;
    }

  }

}
