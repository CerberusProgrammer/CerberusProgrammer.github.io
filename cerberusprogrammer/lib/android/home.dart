import 'package:flutter/material.dart';

class AndroidHome extends StatefulWidget {
  const AndroidHome({super.key});

  @override
  State<AndroidHome> createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('notification zone'),),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Text('bar apps'),
        ),
    );
  }
}
