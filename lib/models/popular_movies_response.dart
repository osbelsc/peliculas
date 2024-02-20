import 'dart:convert';

import 'package:peliculass/models/models.dart';

class PopularMovies {
  int? page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  PopularMovies({
    this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMovies.fromJson(String str) =>
      PopularMovies.fromMap(json.decode(str));

  factory PopularMovies.fromMap(Map<String, dynamic> json) => PopularMovies(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
