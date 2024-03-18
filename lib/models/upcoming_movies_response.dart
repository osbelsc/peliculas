import 'dart:convert';

import 'package:peliculass/models/models.dart';

class UpcomingMovies {
  Map<String, dynamic> dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  UpcomingMovies({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpcomingMovies.fromJson(String str) =>
      UpcomingMovies.fromMap(json.decode(str));

  factory UpcomingMovies.fromMap(Map<String, dynamic> json) => UpcomingMovies(
        dates: (json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
