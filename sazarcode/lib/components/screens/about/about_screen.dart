import 'package:flutter/material.dart';

import 'package:sazarcode/components/shared/circular_progress/circular_progress.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            'My knowledge',
            style: TextStyle(fontSize: 32),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgress(
                    newPercent: 85,
                    widget: Container(),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.indigo.shade900,
                        Colors.indigo.shade500,
                        Colors.indigo.shade300,
                      ],
                      stops: const [0, 0.5, 1],
                    ),
                    backgroundColor: Colors.indigo.shade100,
                    mainColor: Colors.indigo,
                    primaryStrokeWidth: 40,
                    backgroundStrokeWidth: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgress(
                    newPercent: 40,
                    widget: Container(),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.red.shade900,
                        Colors.red.shade500,
                        Colors.red.shade300,
                      ],
                      stops: const [0, 0.5, 1],
                    ),
                    backgroundColor: Colors.red.shade100,
                    mainColor: Colors.red,
                    primaryStrokeWidth: 40,
                    backgroundStrokeWidth: 40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
