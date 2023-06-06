import 'package:flutter/material.dart';

class WindowsHome extends StatelessWidget {
  const WindowsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          height: 40,
          child: Container(
            color: Colors.blue,
            child: Row(
              children: const [],
            ),
          ),
        )
      ],
    );
  }
}
