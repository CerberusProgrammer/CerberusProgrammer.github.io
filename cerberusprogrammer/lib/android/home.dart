import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AndroidHome extends StatefulWidget {
  const AndroidHome({super.key});

  @override
  State<AndroidHome> createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 164, 163, 163),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(),
            Stack(
              children: [
                Image.asset(
                  'lib/assets/background.jpg',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 80,
                  width: 400,
                  child: Card(
                    elevation: 0.5,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.chrome,
                            size: 40,
                          ),
                        ),
                        IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.googlePlay,
                              size: 40,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
