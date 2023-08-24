//import 'dart:ffi';

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
  bool showText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 26, 59),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Detail'),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                buildMovieInformation(context),
                buildInfoName(context),
              ],
            ),
            body()
          ],
        ));
  }

  Widget body() {
    return Column(
      children: [
        builMovieButton(context),
        if (showText)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
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
      ],
    );
  }

  Positioned builMovieButton(BuildContext context) {
    return Positioned(
        bottom: 0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    primary: Color.fromARGB(255, 122, 37, 37),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.650, 65),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
                onPressed: () {
                  setState(() {
                    toggleTextVisibility();
                  });
                },
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'Add to',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void toggleTextVisibility() {
    setState(() {
      showText = !showText;
    });
  }

  Positioned buildInfoName(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
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
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 16, height: 1.60, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView buildMovieInformation(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 3, 26, 59),
          ),
          Image.network(
            'https://image.tmdb.org/t/p/w500/${widget.posterPath}',
            width: double.infinity,
            fit: BoxFit.cover,
            color: Colors.blueGrey.withOpacity(0.4),
            colorBlendMode: BlendMode.darken,
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(255, 3, 26, 59),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.99],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
