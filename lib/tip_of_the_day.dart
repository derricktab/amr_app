import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Tip extends StatefulWidget {
  const Tip({Key? key}) : super(key: key);

  @override
  State<Tip> createState() => _TipState();
}

class _TipState extends State<Tip> {
  List<String> tips = [
    "AMR causes at least 700,000 deaths globally each year, and this number is expected to rise to 10 million by 2050 if action is not taken.",
    "Antibiotics don't work against viruses like colds and flu.",
    "Overusing antibiotics can lead to antibiotic resistance.",
    "Resistance can spread from person to person and between animals and humans.",
    "Antibiotics are often prescribed unnecessarily for illnesses like sore throats and ear infections.",
    "Antibiotics can also be found in the food we eat.",
    "Proper hand washing and infection control can help prevent the spread of resistant bacteria.",
    "Antibiotic resistance could cause up to 10 million deaths annually by 2050.",
    "You can help fight AMR by only taking antibiotics when necessary and completing the full course.",
    "Some common infections that can become resistant to antibiotics include urinary tract infections, pneumonia, tuberculosis, and sexually transmitted infections.",
    "Prevention is key to reducing the spread of AMR. Simple steps like washing your hands regularly, practicing safe sex, and getting vaccinated can all help reduce the need for antibiotics.",
  ];


  static const int pink = 0xFFeb406a;
  var date = "";

  var days = {
    '1': 'Monday',
    '2': 'Tuesday',
    '3': 'Wednesday',
    '4': 'Thursday',
    '5': 'Friday',
    '6': 'Saturday',
    '7': 'Sunday'
  };

  var weekDay;

  @override
  void initState() {
    var now = DateTime.now();
    date = now.toString().substring(0, 10);
// print(date);
    var day = now.weekday.toString();
    weekDay = days[day];
    print(weekDay);
  }

  @override
  Widget build(BuildContext context) {
    int randomNumber = Random().nextInt(10) + 1;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.orange,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(
            Icons.chevron_left,
            size: 45,
          ),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 68,
      ),
      body: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "TIP OF THE DAY",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: "times",
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(
                      children: [
                        // LEFT PANEL
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: Color.fromARGB(255, 227, 207, 181),
                          ),
                          height: 450,
                          width: 50,
                          // child: const Center(child: Text("LEFT")),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 196, 228, 233),
                                borderRadius: BorderRadius.circular(40)),
                            height: 450,
                            width: 250,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: ListView(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // TIP OF THE DAY TEXT
                                  const Text(
                                    "# Did You Know?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: AutoSizeText(
                                      tips[randomNumber],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 10,
                                      style: const TextStyle(
                                        fontSize: 23,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // SHARE BUTTON
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 10)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.orange),
                                        ),
                                        // backgroundColor: ,
                                        onPressed: () async {
                                          await Share.share(tips[randomNumber]);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Text("Share"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(FontAwesomeIcons.share),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),

                        // RIGHT PANEL
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 227, 207, 181),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              )),
                          height: 450,
                          width: 50,
                          // child: const Center(child: Text("RIGHT")),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),

              // Displaying the current date at the bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weekDay,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
