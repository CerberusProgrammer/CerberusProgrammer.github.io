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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 128),
        child: Wrap(
          children: List.generate(10, (index) {
            return SizedBox(
              width: 300,
              height: 350,
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          child: Text('PY'),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          blogs[0].title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '12 May 2023',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
