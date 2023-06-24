import 'package:cerberusprogrammer/android/domain/blog/blog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BlogProvider extends ChangeNotifier {
  List<Blog> blogList = [];

  void syncBlogs() async {
    final databaseReference = FirebaseDatabase.instance.ref().child('blogs');
    await databaseReference.once().then((value) {
      if (value.snapshot.value is Map) {
        Map<dynamic, dynamic> values =
            value.snapshot.value as Map<dynamic, dynamic>;

        values.forEach((key, value) {
          blogList.add(Blog.fromJson(value));
        });
      }
    });
  }
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF4AADD4),
      ),
      onPressed: () {},
      child: const Text('Hello World!'),
    );
  }
}
