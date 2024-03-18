import 'dart:convert';

import 'package:peliculass/models/models.dart';

class TopRatedMovies {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  TopRatedMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRatedMovies.fromJson(String str) =>
      TopRatedMovies.fromMap(json.decode(str));

  factory TopRatedMovies.fromMap(Map<String, dynamic> json) => TopRatedMovies(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
