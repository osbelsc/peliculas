import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String title;
  const MovieSlider({Key? key, required this.movies, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Container(
        height: 300,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
              child: Text(
                this.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, int index) {
                    final movie = movies[index];
                    return _MoviePoster(movie);
                  }),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 300,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
              child: Text(
                "Null title",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, int index) {
                    final movie = movies[index];
                    return Container(width: 100.0, child: _MoviePoster(movie));
                  }),
            ),
          ],
        ),
      );
    }
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            width: 130,
            height: 180,
            image: NetworkImage(movie.fullPosterImg),
            placeholder: AssetImage('assets/loading2.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
          ),
          Container(
              width: 130.0,
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  movie.originalTitle,
                  maxLines: 2,
                ),
              )),
        ],
      ),
    );
  }
}
