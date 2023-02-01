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

              // Metronidazole
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DrugScreen(
                          drugName: "Metronidazole",
                          description:
                              "Metronidazole is an antibiotic that is used to treat bacterial infections of the vagina, stomach, liver, skin, joints, brain and spinal cord, lungs, heart, or bloodstream.\nMetronidazole is also used to treat trichomoniasis, a sexually transmitted disease caused by a parasite. Usually both sexual partners are treated at the same time, even if one has no symptoms.\nDo not use metronidazole to treat any condition that has not been checked by your doctor.",
                          adultDosage: "400mg Twice a day, for 7 Days",
                          childDosage: 'Not Recommended for Children',
                          imagePath: "assets/drug_images/metro.jpg",
                        );
                      },
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 20),
                    child: const Text("Metronidazole"),
                  ),
                ),
              ),

              // Doxycycline
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DrugScreen(
                          drugName: "Doxycycline",
                          description:
                              "Doxycycline is used to treat many different bacterial infections, such as acne, urinary tract infections, intestinal infections, respiratory infections, eye infections, gonorrhea, chlamydia, syphilis, periodontitis (gum disease), and others. Doxycycline works by stopping the growth of bacteria when treating bacterial infections and is also thought to have an anti-inflammatory action when used for other conditions. Doxycycline is a tetracycline antibiotic.",
                          adultDosage:
                              "100 mg Twice a day. h High Dose: 200mg IV BD",
                          childDosage:
                              '2-4mg/kg/day divided into two doses \nNow considered safe for shorter duration (<21 days)',
                          imagePath: "assets/drug_images/doxyclline.jpg",
                        );
                      },
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 20),
                    child: const Text("Doxycycline"),
                  ),
                ),
              ),

              // Clindamycin
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DrugScreen(
                          drugName: "Clindamycin",
                          description:
                              "Clindamycin is an antibiotic that fights bacteria in the body.\nClindamycin is used to treat serious infections caused by bacteria \nClindamycin may also be used for purposes not listed in this medication guide",
                          adultDosage:
                              "Usual Dose: 600-900 mg every after 8 hours.\n Oral Dose: 300mg, 3-4 times a day.",
                          childDosage: '7mg / kg 3 times every day',
                          imagePath: "assets/drug_images/ampi.jpg",
                        );
                      },
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 20),
                    child: const Text("Clindamycin"),
                  ),
                ),
              ),

              // Ampicillin
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DrugScreen(
                          drugName: "Ampicillin",
                          description:
                              "Ampicillin is a penicillin antibiotic that is used to treat or prevent many different types of infections such as bladder infections, pneumonia, gonorrhea, meningitis, or infections of the stomach or intestines.",
                          adultDosage:
                              "Typical dosage is 500 mg, four times per day",
                          childDosage: 'Oral dose is 50-100 mg/kg/day',
                          imagePath: "assets/drug_images/ampici.jpg",
                        );
                      },
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 20),
                    child: const Text("Ampicillin"),
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
