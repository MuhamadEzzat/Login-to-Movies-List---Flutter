import 'package:loginexample/data/dto/movie_data.dart';
import 'package:loginexample/network/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';


class MoviesRepo {

final AppHttpClient _client = Get.find();
  Future<http.Response> getMovies() async{

    late http.Response response;

    response = await _client.get();

    if (response.statusCode == 200){
      print(response);
      print("safddgs");
      return response;
    }else{
      print("safddgs");
      return response;
    }
  }
}