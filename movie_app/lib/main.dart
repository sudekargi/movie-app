import 'package:flutter/material.dart';
import 'package:movie_app/api.dart';
//import 'package:movie_app/home_screen.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        /*appBar: AppBar(
            //title: const Text('Material App Bar'),
            ),*/
        body: Center(
          child: MovieApp(),
        ),
      ),
    );
  }
}
