import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _language = 'es-ES';
  String _Apikey = '37598ea376ac8da5f101e71bb9c3435f';
  String _baseUrl = 'api.themoviedb.org';
  List<Movie> onDisplayMovies = [];
  MoviesProvider() {
    print('inicianlizado');
    this.getNowPlayingMovies();
  }

  getNowPlayingMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _Apikey,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    print(nowPlayingResponse.results[0].title);
    this.onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}
