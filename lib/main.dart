import 'package:amr_app/amr_risk_calculator.dart';
import 'package:amr_app/drugs_and_side_effects.dart';
import 'package:amr_app/faqs.dart';
import 'package:amr_app/home.dart';
import 'package:amr_app/tip_of_the_day.dart';
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
          "tip": (context) => Tip(),
          "faq": (context) => const Faq(),
          "drugs": (context) => const DrugsAndDosages(),
          "amr_risk_calculator": (context) => const AmrRiskCalculator(),
        },
        
        title: 'MyAMR Alert App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: AnimatedSplashScreen(
          splash: "assets/images/logo.png",
          splashIconSize: 260,
          duration: 4000,
          nextScreen: const HomePage(),
        ));
  }
}
