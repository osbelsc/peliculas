import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String title;
  final Function onNextPage;
  const MovieSlider(
      {Key? key,
      required this.movies,
      required this.title,
      required this.onNextPage})
      : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  late final ScrollController scrollControler = new ScrollController();
  @override
  void initState() {
    super.initState();
    scrollControler.addListener(() {
      if (scrollControler.position.pixels >=
          scrollControler.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
      print(scrollControler.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title != null) {
      return Container(
        height: 300,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
              child: Text(
                this.widget.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  controller: scrollControler,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (_, int index) {
                    final movie = widget.movies[index];
                    movie.heroid =
                        '${widget.title}-${index}-${widget.movies[index].title}';
                    return GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details',
                            arguments: movie),
                        child: Hero(
                            tag: movie.heroid!,
                            child: _MoviePoster(
                              movie,
                            )));
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
                  itemCount: widget.movies.length,
                  itemBuilder: (_, int index) {
                    final movie = widget.movies[index];
                    movie.heroid =
                        '${widget.title}-${index}-${widget.movies[index].title}';
                    return Container(
                        width: 100.0,
                        child: Hero(
                            tag: movie.heroid!,
                            child: _MoviePoster(
                              movie,
                            )));
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
