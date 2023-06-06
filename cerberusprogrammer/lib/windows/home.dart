import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

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
              children: const [
                Icon(FluentIcons.window_16_filled),
              ],
            ),
          ),
        )
      ],
    );
  }
}
