import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/movie_provider.dart';

class CastingCard extends StatelessWidget {
  final int idMovie;
  CastingCard(this.idMovie);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(idMovie),
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: CupertinoActivityIndicator(),
          );
        }
        final List<Cast> cast = snapshot.data!;
        return Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 20.0),
                alignment: AlignmentDirectional.topStart,
                child: Text('Actores')),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 170,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, int index) {
                  return _CastCard(cast[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  _CastCard(this.actor);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black38,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            width: 100,
            height: 100,
            image: NetworkImage(actor.fullProfilePath),
            placeholder: AssetImage('assets/loading2.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
          ),
          Container(
            width: 90.0,
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.all(5.0),
            child: Text(
              actor.name,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
