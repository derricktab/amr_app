import 'package:amr_app/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

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
        routes: {
          "home": (context) => const HomePage(),
        },
        title: 'AMR APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          splash: "assets/images/stop_amr.png",
          splashIconSize: 230,
          duration: 4000,
          nextScreen: const HomePage(),
        ));
  }
}
