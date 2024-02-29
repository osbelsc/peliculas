import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculass/models/search_movies_response.dart';

import '../helpers/debouncer.dart';
import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _language = 'es-ES';
  String _Apikey = '37598ea376ac8da5f101e71bb9c3435f';
  String _baseUrl = 'api.themoviedb.org';
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> castMovie = {};
  int _popularPage = 0;
  final debouncer = Debouncer(
      duration: Duration(
    milliseconds: 500,
  ));
  MoviesProvider() {
    print('inicianlizado');
    this.getNowPlayingMovies();
    this.getPopularMovies();
  }

  final StreamController<List<Movie>> _suggestionsStreamControler =
      new StreamController.broadcast();

  Stream<List<Movie>> get suggestionsStream =>
      this._suggestionsStreamControler.stream;
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _Apikey,
      'language': _language,
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }

  getNowPlayingMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    this.onDisplayMovies = nowPlayingResponse.results;
    print(onDisplayMovies);
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData =
        await this._getJsonData('3/movie/now_playing', _popularPage);

    final nowPopularPlayingResponse = PopularMovies.fromJson(jsonData);
    this.popularMovies = [
      ...popularMovies,
      ...nowPopularPlayingResponse.results
    ];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int idMovie) async {
    if (castMovie.containsKey(idMovie)) return castMovie[idMovie]!;
    print('piediendo data');
    final jsonData = await this._getJsonData('3/movie/$idMovie/credits');

    final creditsMovieResponse = CreditsResponse.fromJson(jsonData);
    this.castMovie[idMovie] = creditsMovieResponse.cast;
    print(creditsMovieResponse);
    return creditsMovieResponse.cast;
  }

  Future<List<Movie>> getSearchMovies(String query) async {
    var url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _Apikey,
      'language': _language,
      'query': '$query',
    });
    final response = await http.get(url);

    final searchMovieResponse = SearchMoviesResponse.fromJson(response.body);
    print(searchMovieResponse);
    return searchMovieResponse.results;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await this.getSearchMovies(value);
      this._suggestionsStreamControler.add(results);
    };
    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });
    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
