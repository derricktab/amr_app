import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  SharedPreferences? prefs;
  double score = 0;

// INITIALIZING SHARED PREFERENCES
  initializePrefs() async {
    print("INITIALIZE PREFS CALLED");
    var sharedprefs = await SharedPreferences.getInstance();
    setState(() {
      prefs = sharedprefs;
    });
  }

  calculateScore() async {
    var myPrefs = await SharedPreferences.getInstance();
    var page1Results = myPrefs.getString("page1");
    var page2Results = myPrefs.getString("page2");
    var page3Results = myPrefs.getString("page3");
    var page4Results = myPrefs.getString("page4");
    var page5Results = myPrefs.getString("page5");

    print("PAGE ONE RESULTS: $page2Results");

    // CALCULATING THE PAGE 1 SCORE
    if (page1Results == "yes") {
      score += 2;
    } else if (page1Results == "no") {
      score += 0;
    } else if (page1Results == "maybe") {
      score += 1;
    }

    // CALCULATING THE PAGE 2 SCORE
    if (page2Results == "yes") {
      score += 2;
    } else if (page2Results == "no") {
      score += 0;
    } else if (page2Results == "maybe") {
      score += 1;
    }

    // CALCULATING THE PAGE 3 SCORE
    if (page3Results == "yes") {
      score += 2;
    } else if (page3Results == "no") {
      score += 0;
    } else if (page3Results == "maybe") {
      score += 1;
    }

    // CALCULATING THE PAGE 4 SCORE
    if (page4Results == "yes") {
      score += 2;
    } else if (page4Results == "no") {
      score += 0;
    } else if (page4Results == "maybe") {
      score += 1;
    }

    // CALCULATING THE PAGE 5 SCORE
    if (page5Results == "yes") {
      score += 2;
    } else if (page5Results == "no") {
      score += 0;
    } else if (page5Results == "maybe") {
      score += 1;
    }

    print("THE FINAL SCORE IS: $score");
  }

  var selectedIndex;

  @override
  void initState() {
    initializePrefs();
  }

  @override
  Widget build(BuildContext context) {
    calculateScore();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(
            Icons.chevron_left,
            size: 45,
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          "RESULTS",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}
