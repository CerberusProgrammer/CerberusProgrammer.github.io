import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/blog_provider.dart';
import 'blog_screen.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<BlogProvider>().fetching) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final blogs = context.watch<BlogProvider>().blogs;

    List<Widget> widgets = List.generate(blogs.length, (index) {
      return SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogScreen(blog: blogs[index]),
                ),
              );
            },
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Text(blogs[index].language ?? ''),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    blogs[index].title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    blogs[index].date ?? 'No date',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 128),
        child: MediaQuery.of(context).size.width > 900
            ? Center(
                child: Wrap(
                  children: widgets,
                ),
              )
            : Center(
                child: ListView(
                children: widgets,
              )),
      ),
    );
  }
}
