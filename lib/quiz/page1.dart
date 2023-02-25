import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  SharedPreferences? prefs;

// INITIALIZING SHARED PREFERENCES
  initializePrefs() async {
    print("INITIALIZE PREFS CALLED");
    var sharedprefs = await SharedPreferences.getInstance();
    setState(() {
      prefs = sharedprefs;
    });
  }

  var selectedIndex;

  @override
  void initState() {
    initializePrefs();
  }

  @override
  Widget build(BuildContext context) {
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
          "AMR RISK CALCULATOR",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/measure.png",
                  width: 60,
                  color: Colors.white,
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text(
                    "Measure Your AMR Risk with our AMR Risk Caculator.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // FIRST QUIZ QUESTION
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 35,
                    spreadRadius: 0.2,
                  )
                ]),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                //  QUESTION 1
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    "1. Have you taken antibiotics in the past 2 Months?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                // YES
                InkWell(
                  onTap: () {
                    prefs!.setString("page1", "yes");
                    setState(() {
                      selectedIndex = 0;
                      print("SELECTED IND EX IS 0");
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 0 ? Colors.green : Colors.orange,
                    ),
                    child: const Text(
                      "YES",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // NO
                InkWell(
                  onTap: () {
                    prefs!.setString("page1", "no");
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 1 ? Colors.green : Colors.orange,
                    ),
                    child: const Text(
                      "NO",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // MAYBE
                InkWell(
                  onTap: () {
                    prefs!.setString("page1", "maybe");
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 2 ? Colors.green : Colors.orange,
                    ),
                    child: const Text(
                      "MAYBE",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // NEXT
                InkWell(
                  onTap: () {
                    if (selectedIndex != null) {
                      Navigator.pushReplacementNamed(context, "page2");
                    } else {
                      AnimatedSnackBar.material(
                        'Please select an option to proceed',
                        type: AnimatedSnackBarType.error,
                        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                        duration: const Duration(seconds: 5),
                      ).show(context);
                    }
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
                      "NEXT",
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
        ],
      ),
    );
  }
}
