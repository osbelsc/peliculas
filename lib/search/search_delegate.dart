import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculass/models/models.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar pelicula ';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    if (query.isEmpty) {
      return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.movie_creation_outlined,
                  color: Colors.indigo, size: 100),
              Text('Busca la pelicula de tu agrado')
            ],
          ));
    }

    return FutureBuilder(
      future: moviesProvider.getSearchMovies(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(
            alignment: Alignment.center,
            child: CupertinoActivityIndicator(),
          );
        }
        final List<Movie> movies = snapshot.data!;
        return Container(
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, int index) {
              return ListTile(
                leading: Container(
                  width: 50.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: FadeInImage(
                      placeholder: AssetImage('assets/loading2.gif'),
                      image: NetworkImage(movies[index].fullPosterImg)),
                ),
                title: Text(movies[index].title),
                subtitle: Text(movies[index].originalTitle),
              );
            },
          ),
        );
      },
    );
  }
}
