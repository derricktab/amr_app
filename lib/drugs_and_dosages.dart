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
        title: const Text("Drugs and Dosages"),
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
          ),

          // LIST OF DRUGS
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DrugScreen(
                          drugName: "Amoxicillin",
                          description:
                              "Amoxicillin is a penicillin antibiotic. It is used to treat bacterial infections, such as chest infections (including pneumonia) and dental abscesses.",
                          adultDosage: "500 - 1000mg Thrice a day (PO or IV)",
                          childDosage:
                              '15-20 mg / kg twice daily oral \n 30-35 mg /kg thrice daily IV',
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
