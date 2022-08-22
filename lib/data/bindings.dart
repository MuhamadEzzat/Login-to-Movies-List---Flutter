import 'package:get/get.dart';
import 'package:loginexample/ui/login/login_controller.dart';
import 'package:loginexample/ui/login/login_repo.dart';
import 'package:loginexample/ui/movies/movies_repo.dart';
import 'package:loginexample/ui/movies/movies_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginRepo>(() => LoginRepo());
  }
}

class MoviesBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<MoviesController>(() => MoviesController());
    Get.lazyPut<MoviesRepo>(() => MoviesRepo());
  }
}