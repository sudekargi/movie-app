import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/api.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigateGoHome();
  }

  navigateGoHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => MovieApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 26, 59),
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 200, maxHeight: 200),
        child: Lottie.asset('assets/images/animation.json'),
      ),
    );
  }
}
