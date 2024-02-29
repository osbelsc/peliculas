import 'package:flutter/material.dart';
import 'package:peliculass/providers/movie_provider.dart';
import 'package:peliculass/search/search_delegate.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/pelicula.png'),
          onPressed: () {},
        ),
        title: Text('Peliculas'),
        elevation: 10,
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: Icon(
                Icons.search_outlined,
              )),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/unnamed.png'),
              backgroundColor: Colors.white70,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          MovieSlider(
              movies: moviesProvider.popularMovies,
              title: "Populares",
              onNextPage: () => moviesProvider.getPopularMovies()),
        ]),
      ),
    );
  }
}
