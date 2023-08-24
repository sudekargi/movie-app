import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/detail.dart';

const apiKey = '8bc3c7f1c58e6ac9d45e0d9d62bc0e57';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  List<Map<String, dynamic>> _movies = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _movies = List<Map<String, dynamic>>.from(data['results']);
      });
    } else {
      throw Exception('Veri çekme başarısız: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: _CustomClipper(),
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 3, 26, 59),
              child: Center(
                child: Text(
                  'Populer Films',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5 / 8,
            mainAxisSpacing: 11,
            crossAxisSpacing: 15,
          ),
          itemCount: _movies.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = _movies[index];
            final movieName = movie['title'];
            final posterPath = movie['poster_path'];
            final overview = movie['overview'];
            final rating = movie['vote_average'];
            final popularity = movie['popularity'];
            final language = movie['original_language'];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                        movieName: movieName,
                        posterPath: posterPath,
                        overview: overview,
                        rating: double.parse(rating.toString()),
                        popularity: popularity,
                        language: language,
                        index: index),
                  ),
                );
              },
              child: MovieCard(posterPath: posterPath, movieName: movieName),
            );
          },
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String posterPath;
  final String movieName;

  const MovieCard({required this.posterPath, required this.movieName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/$posterPath',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
