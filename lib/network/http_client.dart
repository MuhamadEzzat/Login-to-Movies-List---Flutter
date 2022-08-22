import 'dart:convert';
import 'package:http/http.dart' as http;

class AppHttpClient {

  String get _baseUrl => "https://api.themoviedb.org/3/discover/movie?api_key=92346f3b534399fdc62122746fcb80b1&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate";

  Future<http.Response> get() {
    Uri url = Uri.parse(_baseUrl);
    return http.get(url).timeout(
        const Duration(seconds: 10));
  }

}