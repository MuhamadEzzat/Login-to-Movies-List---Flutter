import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:loginexample/data/dto/movie_data.dart';
import 'package:loginexample/ui/movies/movies_repo.dart';

class MoviesController extends GetxController {
  var  moviesData =[MovieData()].obs ;
  final MoviesRepo _repo = Get.find();
  List<MovieData> movies = [];

  Future<void> getMovies() async {
    var response = await _repo.getMovies();


    Map data = jsonDecode(response.body);
    List<dynamic> results = data['results'];
    for (var i in results){
      MovieData instance = MovieData(overview: i['overview'], title: i['title'], poster_path: i['poster_path'], is_fav: false,id: i['id']);
      moviesData.add(instance);
    }
  }
}