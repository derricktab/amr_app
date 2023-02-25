import 'package:amr_app/measures.dart';
import 'package:amr_app/quiz/amr_risk_calculator.dart';
import 'package:amr_app/drugs_and_side_effects.dart';
import 'package:amr_app/faqs.dart';
import 'package:amr_app/home.dart';
import 'package:amr_app/quiz/page1.dart';
import 'package:amr_app/quiz/page2.dart';
import 'package:amr_app/quiz/page3.dart';
import 'package:amr_app/quiz/page4.dart';
import 'package:amr_app/quiz/page5.dart';
import 'package:amr_app/quiz/results.dart';
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
        "tip": (context) => const Tip(),
        "faq": (context) => const Faq(),
        "drugs": (context) => const DrugsAndDosages(),
        "amr_risk_calculator": (context) => const AmrRiskCalculator(),
        "page1": (context) => const Page1(),
        "page2": (context) => const Page2(),
        "page3": (context) => const Page3(),
        "page4": (context) => const Page4(),
        "page5": (context) => const Page5(),
        "results": (context) => const Results(),
        "measures": (context) => const Measures(),
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
      ),
    );
  }
}
