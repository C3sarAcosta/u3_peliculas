import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:u3_peliculas/models/now_playing_response.dart';

//El provaider es el proveedor de la informacion
class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _language = 'es-MX';

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);

    print(nowPlayingResponse.results[0].title);

    //print(response.body);
  }
}
