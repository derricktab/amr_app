// ignore_for_file: use_build_context_synchronously

import 'package:amr_app/drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool imagePicked = false;
  String? pickedImagePath;
  var picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyAMR Alert App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: const ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        child: MyDrawer(),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          Image.asset("assets/images/amr.jpg"),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.26),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),

            // ABOUT AMR
            child: const Text(
              "About AMR",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: const Text(
              "Antimicrobial resistance (AMR) is the ability of microorganisms such as bacteria, viruses, fungi, and parasites to resist the effects of antimicrobial drugs that were previously effective in treating infections. This means that the microorganisms continue to grow and cause infection, even when treated with antimicrobial drugs that would normally be effective.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 0.6,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // CAUSES OF AMR
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.26),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),

            // ABOUT AMR
            child: const Text(
              "Causes Of AMR",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: Column(
              children: [
                const Text(
                  "The development of AMR is a natural process, but it has been accelerated by factors such as the overuse and misuse of antimicrobial drugs, poor infection control practices, and the lack of development of new antimicrobial drugs. The consequences of AMR can be severe and include increased morbidity and mortality, longer hospital \nAntimicrobial Resistance(AMR) is caused by the following: ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.circle, color: Colors.orange, size: 15),
                    const SizedBox(width: 7),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        "When human and animal health professionals over prescribe antibiotics",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.circle, color: Colors.black, size: 15),
                    const SizedBox(width: 7),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        "When people don’t take antibiotics as directed",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.circle, color: Colors.orange, size: 15),
                    const SizedBox(width: 7),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        "Due to poor hygiene and a lack of infection prevention and control e.g. not washing hands properly",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.circle, color: Colors.black, size: 15),
                    const SizedBox(width: 7),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        "Due to people travelling around the world, spreading resistant bacteria.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          //
        ],
      ),
    );
  }
}
