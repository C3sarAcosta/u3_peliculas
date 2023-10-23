import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:u3_peliculas/models/now_playing_response.dart';
import 'package:u3_peliculas/models/popular_response.dart';
import '../models/models.dart';

//El provaider es el proveedor de la informacion
class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _language = 'es-MX';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularlayMovies = [];
  //LLenar los actores int = id de la pelicula
  Map<int, List<Cast>> moviesCast = {};

  MoviesProvider() {
    //print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);

    //print(nowPlayingResponse.results[0].title);
    onDisplayMovies = nowPlayingResponse.results;
    //notifyListeners(); Le comunica a todos los widgets que estan escuchando
    //que se cambio la data por lo tanto se redibujan.
    notifyListeners();
    //print(response.body);
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);

    final popularResponse = PopularResponse.fromRawJson(response.body);

    //Destructurar resultado para cambiar de pagina y mantener las actuales
    //Concatenar las peliculas
    popularlayMovies = [...popularlayMovies, ...popularResponse.results];
    notifyListeners();
  }

  //Metodo para obtener el cast
  Future<List<Cast>> getMovieCast(int movieId) async {
    //Revisamos el mapa para determiar si existe en memoria los actores
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    var url = Uri.https(_baseUrl, '3/movie/$movieId/credits',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final creditsResponse = CreditsResponse.fromJson(response.body);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}
