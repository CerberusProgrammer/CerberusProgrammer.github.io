import 'package:flutter/material.dart';
import 'package:sazarcode/models/blog.dart';
import 'package:firebase_database/firebase_database.dart';

class BlogProvider extends ChangeNotifier {
  bool fetching = false;
  List<Blog> blogs = [];

  void syncBlogs() {
    // TODO: call API and send the blogs to the list.
    fetching = true;
    print('uwu');
    final databaseReference = FirebaseDatabase.instance.ref().child('blogs');
    databaseReference.once().then((value) {
      if (value.snapshot.value is Map) {
        Map<dynamic, dynamic> values =
            value.snapshot.value as Map<dynamic, dynamic>;

        values.forEach((key, value) {
          blogs.add(Blog.fromJSON(value));
          print(blogs[0].title);
        });
        fetching = false;
        notifyListeners();
      }
    });
  }
}
