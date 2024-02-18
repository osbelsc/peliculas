import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no movie';
    return Scaffold(
      body: CustomScrollView(slivers: [
        _CustomAppbar(),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterandTitle(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            CastingCard(),
          ]),
        ),
      ]),
    );
  }
}

class _PosterandTitle extends StatelessWidget {
  const _PosterandTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Poster(),
      ],
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster({super.key});

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
            ('https://m.media-amazon.com/images/M/MV5BODA4NTk3MTQwN15BMl5BanBnXkFtZTcwNjUwMTMxNA@@._V1_.jpg'),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('titulo.pelicula'),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading2.gif'),
          image: NetworkImage(
            ('https://m.media-amazon.com/images/M/MV5BODA4NTk3MTQwN15BMl5BanBnXkFtZTcwNjUwMTMxNA@@._V1_.jpg'),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text(
        'Reprehenderit adipisicing ipsum aliqua minim in sunt consequat. Velit nostrud ad non qui. Cupidatat laborum quis nisi ea et aliqua non sint Lorem irure dolor. Ea cillum ipsum excepteur ipsum ut nisi magna est amet do duis anim id. Cupidatat exercitation ex in in ex aute anim sunt laboris deserunt. Officia do officia ad amet reprehenderit incididunt culpa.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
