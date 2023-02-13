import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DrugScreen extends StatefulWidget {
  final String drugName;
  final String description;
  final String imagePath;
  final String adultDosage;
  final String childDosage;
  const DrugScreen(
      {super.key,
      required this.drugName,
      required this.description,
      required this.imagePath,
      required this.adultDosage,
      required this.childDosage});

  @override
  State<DrugScreen> createState() => _DrugScreenState();
}

class _DrugScreenState extends State<DrugScreen> {
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("${widget.drugName} Dosage"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // DRUG IMAGE
          Image.asset(
            widget.imagePath,
            height: 320,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),

          // DRUG NAME
          Text(
            widget.drugName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),

          const SizedBox(height: 20),

          // BRIEF INFO ABOUT THE DRUG
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),

          // ADULT DOSAGE
          Container(
            margin: const EdgeInsets.only(right: 240, left: 10),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "ADULT DOSE",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // DOSAGE TEXT
          DottedBorder(
            borderPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            radius: const Radius.circular(20),
            borderType: BorderType.RRect,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(widget.adultDosage),
            ),
          ),

          const SizedBox(height: 20),

          // PEDIATRIC DOSAGE
          Container(
            margin: const EdgeInsets.only(right: 240, left: 10),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "CHILD DOSE",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // CHILD DOSAGE TEXT
          DottedBorder(
            borderPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            radius: const Radius.circular(20),
            borderType: BorderType.RRect,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 25,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(widget.childDosage),
            ),
          ),
        ],
      ),
    );
  }
}
