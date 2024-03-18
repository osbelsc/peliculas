import 'package:flutter/material.dart';
import 'package:peliculass/providers/movie_provider.dart';
import 'package:peliculass/search/search_delegate.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    int currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        leading: IconButton(
          icon: Image.asset('assets/pelicula.png'),
          onPressed: () {},
        ),
        title: Text(
          'Watch Now',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
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
          MovieSlider(
              movies: moviesProvider.upcomingMovies,
              title: "Coming Soon",
              onNextPage: () => moviesProvider.getUpcomingMovies()),
          MovieSlider(
              movies: moviesProvider.topRatedMovies,
              title: "Top Rating",
              onNextPage: () => moviesProvider.getTopRatedMovies()),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30.0,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  color: Colors.indigo,
                  Icons.movie_outlined,
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  color: Colors.indigo,
                  Icons.bubble_chart_rounded,
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Icon(color: Colors.indigo, Icons.widgets_rounded))
          ]),
    );
  }
}
