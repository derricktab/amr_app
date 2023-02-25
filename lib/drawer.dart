import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30,
      child: ListView(
        children: [
          DrawerTheme(
            data: const DrawerThemeData(),
            child: SizedBox(
              height: 200,
              child: Center(
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
          Container(
            color: Colors.orange,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              children: [
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),

                // TIP OF THE DAY
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "tip");
                  },
                  leading: const Icon(
                    Icons.flare,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: Text(
                    "Tip Of The Day",
                    style: TextStyle(color: Colors.grey[900], fontSize: 16),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),

                // DRUGS AND DOSANGES
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "drugs");
                  },
                  leading: const Icon(
                    Icons.medication_liquid_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: Text(
                    "Drugs & Side Effects",
                    style: TextStyle(color: Colors.grey[900], fontSize: 16),
                  ),
                ),

                // AMR RISK CALCULATOR
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "amr_risk_calculator");
                  },
                  leading: const Icon(
                    Icons.medication_liquid_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: Text(
                    "AMR RISK CALCULATOR",
                    style: TextStyle(color: Colors.grey[900], fontSize: 16),
                  ),
                ),

                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),

                // FREQUENTLY ASKED QUESTIONS
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "faq");
                  },
                  leading: const Icon(
                    Icons.quiz_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: Text(
                    "Frequently Asked Questions",
                    style: TextStyle(color: Colors.grey[900], fontSize: 16),
                  ),
                ),

                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
