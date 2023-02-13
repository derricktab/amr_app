// ignore_for_file: use_build_context_synchronously

import 'package:amr_app/drawer.dart';
import 'package:amr_app/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  _popupDialog(BuildContext context) {
    return AlertDialog(
        title: const Text(
          "Select Image Source",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 19,
            color: Color.fromARGB(255, 195, 47, 3),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // PICKING IMAGE FROM CAMERA
            ListTile(
              title: const Text("Pick From Camera"),
              leading: const Icon(
                FontAwesomeIcons.camera,
                color: Colors.black,
                size: 30,
              ),
              onTap: () async {
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Results(imagePath: image!.path)),
                  ),
                );
              },
            ),

            // PICKING IMAGE FROM GALLERY
            ListTile(
              title: const Text("Pick From Gallery"),
              leading: const Icon(
                FontAwesomeIcons.image,
                color: Colors.black,
                size: 30,
              ),
              onTap: () async {
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Results(imagePath: image!.path)),
                  ),
                );
              },
            ),
          ],
        ));
  }

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
              "Antimicrobial Resistance(AMR) happens when microorganisms (such as bacteria, fungi, viruses, and parasites) change when they are exposed to antimicrobial drugs (such as antibiotics, antifungals, antivirals, antimalarials, and anthelmintics). Microorganisms that develop antimicrobial resistance are sometimes referred to as 'superbugs'. As a result, the medicines become ineffective and infections persist in the body, increasing the risk of spread to others.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
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
                  "Antimicrobial Resistance(AMR) is caused by the following: ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
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
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 30,
      //   notchMargin: 6,
      //   shape: const CircularNotchedRectangle(),
      //   child: Container(
      //     padding: EdgeInsets.symmetric(
      //         horizontal: MediaQuery.of(context).size.width * 0.18),
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         // HOME BUTTON
      //         GestureDetector(
      //           onTap: () {
      //             print("GOING TO HOME");
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: const [
      //               Icon(
      //                 Icons.home,
      //                 size: 30,
      //                 color: Color.fromARGB(255, 245, 127, 1),
      //               ),
      //               Text(
      //                 "Home",
      //                 style: TextStyle(
      //                   color: Color.fromARGB(255, 245, 127, 1),
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),

      //         // OTHER BUTTON
      //         GestureDetector(
      //           onTap: () {
      //             print("THE OTHER BUTTON");
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: const [
      //               Icon(
      //                 Icons.info,
      //                 size: 30,
      //                 color: Colors.black,
      //               ),
      //               Text(
      //                 "About",
      //                 style: TextStyle(color: Colors.black),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) => _popupDialog(context));
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.camera_enhance,
          color: Colors.white,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
