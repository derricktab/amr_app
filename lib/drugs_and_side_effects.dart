import 'package:amr_app/drug_screen.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class DrugsAndDosages extends StatefulWidget {
  const DrugsAndDosages({super.key});

  @override
  State<DrugsAndDosages> createState() => _DrugsAndDosagesState();
}

class _DrugsAndDosagesState extends State<DrugsAndDosages> {
  List<Map<String, dynamic>> drugs = [
    // AMOXICILLIN
    {
      "name": "Amoxicillin",
      "description":
          "Amoxicillin is a prescription medication that treats several types of bacterial infections, such as  ear, nose, and throat infections including strep throat,Urinary tract infections, lower respiratory tract infections, skin infections , Helicobacter pylori infections(adults only). It is a type of penicillin antibiotic.",
      "img_url": "assets/drug_images/amoxillin.jpg",
      "side_effects":
          "The most common side effects are nausea, vomiting, diarrhoea, skinrash, Headache, Taste and smell changes, Allergic reactions,stomach pain or tenderness.",
    },

    // Metronidazole
    {
      "name": "Metronidazole",
      "description":
          "It is used to treat bacterial infections in different areas of the body. The extended release tablets are used to treat women with vaginal infections. (bacterial vaginosis). It works by killing bacteria or preventing their growth.",
      "img_url": "assets/drug_images/metro.jpg",
      "side_effects":
          "Agitation, Backpain,blindness,blurred vision,burning, numbness,tingling or painful sensations in the hands or feet, changes in speech patterns,confusion, decreased vision,depression,diziness,drowsiness, eyepain, fever, headache, irritability,lack of coordination, nausea, seeing or hearing things that are not there, seizures,shakiness and unsteady walk,slurred speech, trouble speaking,unsteadiness, trembling or other problems with muscle control or coordination,unusual tiredness or weakness, vomiting, weakness in the arms, hands, legs or feet",
    },

    // Doxycycline
    {
      "name": "Doxycycline",
      "description":
          "It is used to treat many different bacterial infections such as acne,urinary tract infections, eye infections, gonorrhoea, chlamydia, syphilis, periondontitis(gum disease) and others. ",
      "img_url": "assets/drug_images/Doxycycline/doxy.webp",
      "side_effects":
          "Loss of Apetite, Nausea and Vomiting, Diarrhea, Rash, Senstivity to the sun, Hives, Temporary discoloring of adult teeth, weight loss, dehydation,Fever, Stomach cramping and pain.",
    },

    // Clindamycin

    {
      "name": "Clindamycin",
      "description":
          "It is used to fight bacteria in the body. It is used to treat certain types of bacterial infections of the lungs, skin, blood, female reproductive organs and internal organs. It works by slowing or stopping the growth of bacteria.Clindamycin is prescribed for respiratory infections with streptococci, pneumococci and staphylococci bacteria, Emphsyema, anaerobic pnemonitis or an abscess in the lung, blood poisoning, infections from anaerobic bacteria in the gut, resulting in peritonitis or an abscess in the abdomen, Endometriosis, pelvic cellulitis, an abscess in the reproductive system or a vaginal cuff infection.",
      "img_url": "assets/drug_images/clinda.jpg",
      "side_effects":
          "The most common side effects are diarrhoea. Other possible side effects include abdominal pain, irritation of th esophagus, nausea and vomiting, allergic skin reactions, severe allergic reactions, inflammation of the vagina, fluid build up under the skin, impeded liver function, impeded kidney function, blood disorders, disrupted function of the immune system, arthritis. People using a clindamycin solution or lotion for acne may report skin relared side effects including dryness, flushing or discoloration, a burning or stinging sensation, peeling ,itchiness, oilness",
    },

    // Ampicillin
    {
      "name": "Ampicillin",
      "description":
          "Ampicillin is used to treat certain infections that are caused by bacteria such as meningitis(infection of membranes that surround the brain and spinal cord) and infections of the throat, sinuses, lungs, reproductive organs, urinary tract and gastrointestinal tract.",
      "img_url": "assets/drug_images/ampi.jpg",
      "side_effects":
          "Most common side effects include nausea, vomiting, diarrhea, mouth/tongue sores may occur ,bleeding, blistering, burning eyes, coldness, discoloration of the skin, feeling of pressure, hives, infection, inflammation, itching, lumps, numbness, pain, rash, redness of the skin, scarring, soreness, stinging, swelling, tenderness, tingling, ulceration or warmth at the injection site, vaginal itching or discharge",
    },
  ];

  List<Map<String, dynamic>> filteredDrugs = [];
  bool isSearching = false;

  void _filterDrugs(String query) {
    setState(() {
      filteredDrugs = drugs
          .where((drug) => drug['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();

      isSearching = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> drugsToDisplay = [];
    // SETTING THE DRUGS LIST

    if (isSearching && filteredDrugs.isNotEmpty) {
      setState(() {
        drugsToDisplay = filteredDrugs;
      });
    } else {
      drugsToDisplay = drugs;
    }

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
            onKeywordChanged: (query) {
              if (filteredDrugs.isEmpty) {
                setState(() {
                  isSearching = false;
                });
              }

              // PERFORM THE SEARCH
              _filterDrugs(query);
            },
          ),

          if (isSearching && filteredDrugs.isEmpty)
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: const Center(
                child: Text(
                  "No Drugs Found",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),

          // LIST OF DRUGS
          if (filteredDrugs.isNotEmpty || isSearching == false)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: drugsToDisplay.map((drug) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DrugScreen(
                            drugName: drug["name"],
                            description: drug["description"],
                            sideeffects: drug["side_effects"],
                            imagePath: drug["img_url"],
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
                      child: Text(drug["name"]),
                    ),
                  ),
                );
              }).toList(),
            )
        ],
      ),
    );
  }
}
