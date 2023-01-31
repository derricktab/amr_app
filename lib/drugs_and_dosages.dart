import 'package:flutter/material.dart';

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
        title: Text("Dosage Of Antibiotics Drugs"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,)
          
        ],
      ),
    );
  }
}
