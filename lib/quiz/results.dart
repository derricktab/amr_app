import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  SharedPreferences? prefs;
  int score = 0;

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
    score = 2;

    bool low = score < 4 ? true : false;
    bool moderate = score >= 4 ? true : false;
    bool high = score >= 7 ? true : false;

    String riskText = high
        ? "HIGH RISK"
        : low
            ? "LOW RISK"
            : "MODERATE RISK";

    String recommendation = high
        ? "Based on your responses, you have a high risk for AMR. We strongly recommend that you schedule an appointment with your healthcare provider as soon as possible to discuss your results and receive further testing and treatment options."
        : low
            ? "Great news! Your results indicate that you have a low risk for antimicrobial resistance. Keep up the good work by using antibiotics responsibly, practicing good hygiene, and following healthcare advice."
            : "Your results show a moderate risk of AMR. This means that you may be at risk of developing antibiotic resistance and it's important to take action now to reduce your risk. Simple steps like finishing prescribed antibiotics, not sharing antibiotics, and avoiding unnecessary antibiotic use can help.";
    var riskColor = high
        ? Colors.red
        : low
            ? Colors.green
            : Colors.orange;

    return Scaffold(
      // APPBAR
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

      // MAIN RESULTS BODY
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 20,
            )
          ],
        ),
        child: Column(
          children: [
            // IMAGE
            Image.asset(high
                ? "assets/images/danger.webp"
                : low
                    ? "assets/images/success.png"
                    : "assets/images/moderate.jpg"),
            const SizedBox(height: 20),

            // RISK STATUS
            Text(
              "$riskText (${score * 10}%)",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: riskColor,
              ),
            ),

            const SizedBox(height: 20),

            // RECOMMENDATION TEXT
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: riskColor,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: AutoSizeText(
                recommendation,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // CLOSE BUTTON
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: const Text(
                  "CLOSE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
