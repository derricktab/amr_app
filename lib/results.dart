import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class Results extends StatefulWidget {
  final String imagePath;

  const Results({super.key, required this.imagePath});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool isLoading = true;
  String? predictedClass;
  double confidence = 0;

  runPrediction() async {
    String? res = await Tflite.loadModel(
        model: "assets/model/model.tflite",
        labels: "assets/model/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );

    var recognitions = await Tflite.runModelOnImage(
        path: widget.imagePath, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    setState(() {
      isLoading = false;
      predictedClass = recognitions![0]["label"].toString().split(" ").last;
      confidence = double.parse(
          (recognitions[0]["confidence"] * 100).toStringAsFixed(2));
    });
  }

  disponseModel() async {
    await Tflite.close();
  }

  // INIT STATE
  @override
  void initState() {
    runPrediction();
  }

  displayLoader() {
    return const Center(
      child: SpinKitFoldingCube(
        color: Colors.orange,
        size: 80,
      ),
    );
  }

  // DISPOSE
  @override
  void dispose() {
    disponseModel();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? displayLoader()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: const Icon(
                  Icons.chevron_left,
                  size: 45,
                ),
              ),
              title: const Text(
                "Results",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                // DISPALYING THE SELECTEC IMAGE
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.file(
                      File(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Text(
                  predictedClass!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "CONFIDENCE: ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$confidence%',
                      style: TextStyle(
                        fontSize: 25,
                        color: confidence > 50 ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
