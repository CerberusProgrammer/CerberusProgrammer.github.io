import 'package:flutter/material.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'My recent work',
            style: TextStyle(fontSize: 32),
          ),
        ),
        const Text(
          'Here are the project that I build.',
          style: TextStyle(fontSize: 18),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 64,
            vertical: 32,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Row(
                  children: List.generate(3, (index) {
                    return Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.purple,
                        elevation: 0,
                        child: Center(
                          child: FilledButton(
                              onPressed: () {},
                              child: const Text('Visit the app')),
                        ),
                      ),
                    ));
                  }),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
