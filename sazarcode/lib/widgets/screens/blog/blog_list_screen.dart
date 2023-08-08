import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/blog_provider.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blogs = context.watch<BlogProvider>().blogs;

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: blogs.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              title: Text(
                blogs[index].title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
    );
  }
}
