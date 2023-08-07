import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazarcode/widgets/providers/blog_provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<BlogProvider>().fetching) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final blog = context.watch<BlogProvider>().blogs[0];

    return Scaffold(
      body: Markdown(
        data: blog.markdownContent,
      ),
    );
  }
}
