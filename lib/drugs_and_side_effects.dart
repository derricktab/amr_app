import 'package:amr_app/drug_screen.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class DrugsAndDosages extends StatefulWidget {
  const DrugsAndDosages({super.key});

  @override
  State<DrugsAndDosages> createState() => _DrugsAndDosagesState();
}

class _DrugsAndDosagesState extends State<DrugsAndDosages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drugs and Side Effects"),
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(
            Icons.chevron_left,
            size: 45,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),

          // SEARCH BAR
          OutlineSearchBar(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            borderColor: Colors.grey,
            borderRadius: BorderRadius.circular(40),
            hintText: 'Search Drug',
            elevation: 5,
            clearButtonColor: Colors.black,
          ),

          // LIST OF DRUGS
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AMOXICILLIN
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DrugScreen(
                          drugName: "Amoxicillin",
                          description:
                              "Amoxicillin is a prescription medication that treats several types of bacterial infections, such as  ear, nose, and throat infections including strep throat,Urinary tract infections, lower respiratory tract infections, skin infections , Helicobacter pylori infections(adults only). It is a type of penicillin antibiotic.",
                          sideeffects:
                              "The most common side effects are nausea, vomiting, diarrhoea, skinrash, Headache, Taste and smell changes, Allergic reactions,stomach pain or tenderness.",
                          imagePath: "assets/drug_images/amoxillin.jpg",
                        );
                      },
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 20),
                    child: const Text("Amoxicillin"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
