import 'package:flutter/material.dart';
import 'package:peliculass/pages/pages.dart';

void main() {
  runApp(const MyApp());
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
