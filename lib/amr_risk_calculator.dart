import "package:flutter/material.dart";


class AmrRiskCalculator extends StatefulWidget {
  const AmrRiskCalculator({super.key});

  @override
  State<AmrRiskCalculator> createState() => _AmrRiskCalculatorState();
}

class _AmrRiskCalculatorState extends State<AmrRiskCalculator> {
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
        toolbarHeight: 70,
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          "AMR RISK CALCULATOR",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}