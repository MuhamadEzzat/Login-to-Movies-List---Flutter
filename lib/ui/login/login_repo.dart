import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {

  Future<void> getUserData() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("username", "ezzat");
    await prefs.setString("password", "123");
  }
}