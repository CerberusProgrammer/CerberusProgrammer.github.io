import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: 0,
      onDestinationSelected: (value) {},
      children: const [
        NavigationDrawerDestination(
          icon: Icon(Icons.add),
          label: Text('Add'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.abc),
          label: Text('Abc'),
        ),
      ],
    );
  }
}
