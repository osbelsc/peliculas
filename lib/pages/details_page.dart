import 'package:flutter/material.dart';
import 'package:peliculass/models/movie.dart';
import 'package:peliculass/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

import '../widgets/widgets.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(slivers: [
        _CustomAppbar(movie),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterandTitle(movie),
            _Overview(movie),
            CastingCard(movie.id),
          ]),
        ),
      ]),
    );
  }
}

class _PosterandTitle extends StatelessWidget {
  final Movie movie;
  const _PosterandTitle(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Poster(movie),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                movie.title,
                textAlign: TextAlign.left,
              ),
              Text(
                movie.originalTitle,
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline),
                  Text(
                    '${movie.voteAverage}',
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class _Poster extends StatelessWidget {
  final Movie movie;
  const _Poster(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 100,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage(
          placeholder: AssetImage('assets/loading2.gif'),
          image: NetworkImage(
            (movie.fullPosterImg),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  final Movie movie;

  const _CustomAppbar(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(movie.originalTitle),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading2.gif'),
          image: NetworkImage(
            (movie.fullBackdropPath),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
