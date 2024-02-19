import 'package:flutter/material.dart';
import 'package:peliculass/pages/pages.dart';
import 'package:peliculass/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Appstate());
}

class Appstate extends StatelessWidget {
  const Appstate({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PeliculaS',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'details': (_) => DetailsPage(),
      },
      theme: ThemeData.dark()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)),
    );
  }
}
