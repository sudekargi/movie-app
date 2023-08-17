import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String movieName;
  final String posterPath;
  final String overview;
  final double rating;
  final double popularity;
  final String language;
  final int index;

  const DetailPage({
    Key? key,
    required this.movieName,
    required this.posterPath,
    required this.overview,
    required this.rating,
    required this.popularity,
    required this.language,
    required this.index,
  }) : super(key: key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 26, 59),
        title: Text('Film Detayı'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Color.fromARGB(255, 3, 26, 59),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500/${widget.posterPath}',
                  fit: BoxFit.cover,
                  color: Colors.blueGrey.withOpacity(0.4),
                  colorBlendMode: BlendMode.darken,
                ),
                SizedBox(height: 20),
                Text(
                  widget.movieName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  widget.overview,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Rating: ${widget.rating}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Popularity: ${widget.popularity}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Language: ${widget.language}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
