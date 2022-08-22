import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginexample/utils/routes.dart';
import 'package:loginexample/ui/login/login_screen.dart';
import 'package:loginexample/data/bindings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loginexample/network/http_client.dart';
import 'package:loginexample/ui/movies/movies_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async => AppHttpClient(), permanent: true);
  await Get.putAsync(() async => SharedPreferences.getInstance(), permanent: true );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.login,
      getPages: [
        GetPage(
            name: Routes.login,
            page: () => LoginScreen(),
            binding: LoginBinding()
        ),
        GetPage(
            name: Routes.movies,
            page: () => MoviesScreen(),
            binding: MoviesBinding()
        )
      ],
    );
  }
}