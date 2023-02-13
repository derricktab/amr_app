import 'package:flutter/material.dart';

class ItemModel {
  bool expanded;
  bool canTapOnHeader;
  String headerItem;
  String discription;
  Color colorsItem;
  // String img;

  ItemModel(
      {this.expanded = false,
      this.canTapOnHeader = true,
      required this.headerItem,
      required this.discription,
      required this.colorsItem});
}

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "FREQUENTLY ASKED QUESTIONS",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 500),
              dividerColor: Colors.orange,
              elevation: 2,
              children: [
                //Expansion pannel
                ExpansionPanel(
                  body: Container(
                    //decorating the expansion panel
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(66, 255, 153, 0),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 2.0, color: Colors.white),
                    ),

                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          itemData[index].discription,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 0.5,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          itemData[index].headerItem,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                  isExpanded: itemData[index].expanded,
                  canTapOnHeader: true,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  itemData[index].expanded = !itemData[index].expanded;
                });
              },
            );
          },
        ),
      ),
    );
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
      headerItem: 'What does AMR mean?',
      discription:
          "Antimicrobial Resistance (AMR) occurs when a specific antimicrobial drug is ineffective in killing or slowing down the growth of a targeted microorganism. Development of resistance stops or reduces the effectiveness of antimicrobial agents intended to treat human/animal infections caused by microbial pathogens. The emergence of AMR threatens our ability to fight human and animal diseases with potentially serious public health implications. This could narrow the line of defense against bacterial infections to only a few antibiotics and increase health care costs.",
      colorsItem: Colors.blue,
      // img: 'assets/images/android_img.png',
    ),
    ItemModel(
        expanded: true,
        headerItem: 'What are antimicrobial agents?',
        discription:
            'The terms "antimicrobials" or "antimicrobial agents" simply refer to all types of natural and synthetic drugs which may kill or slow down the growth of microorganisms. These include antibiotics, anti-fungals, and household disinfectants. Antimicrobial agents are widely used for the treatment and prevention of human and animal diseases, and in the agriculture industry they are also used to promote growth.',
        colorsItem: Colors.black
        // img: 'assets/images/android_img.png',
        ),
    ItemModel(
      headerItem:
          'How does antimicrobial resistance develop and how is it disseminated?',
      discription:
          "Over-use and/or inappropriate use of antimicrobial drugs generally lead to increased AMR. Time plays an important role in determining the likelihood of resistance since the probability that an organism will develop resistance increases with the length of exposure. Some bacterial species are naturally resistant to a wide variety of antimicrobials. However, resistance can also be acquired by mutation in the genetic constituents of microorganisms which contain antibiotic resistance genes. The ability of resistant microorganisms to transfer these resistance genes to drug-susceptible ones makes AMR a potentially critical public health issue. \n\nAntimicrobial resistance is disseminated through a variety of ways such as exchange of resistant genes among different bacterial populations in animals and humans. For example, resistant microorganisms can spread from animals to humans through the food supply and can also persist in the environment as a result of the use of antimicrobial drugs in animal husbandry (farming).",
      colorsItem: Colors.blue,
      // img: 'assets/images/android_img.png',
    ),
    ItemModel(
      headerItem:
          'Can the use of household disinfectants or antiseptics contribute to resistance?',
      discription:
          "The association between the use of household disinfectants/antiseptics that contain antibacterial agents and the development of AMR has been widely reported. Widespread use may lead to increased emergence of resistance in microorganisms. Resistance may develop not only against the disinfectants, but cross-resistance to antimicrobials used in human medicine may also appear.",
      colorsItem: Colors.orange,
      // img: 'assets/images/android_img.png',
    ),
    ItemModel(
      headerItem: 'Why are antimicrobials used in food-producing animals?',
      discription:
          "Antimicrobials are prescribed and used therapeutically for the treatment of animal diseases. Antimicrobials are also added to the feed of food-producing animals to promote growth, to increase feed efficiency, and to prevent infections.",
      colorsItem: Colors.blue,
      // img: 'assets/images/android_img.png',
    ),
  ];
}
