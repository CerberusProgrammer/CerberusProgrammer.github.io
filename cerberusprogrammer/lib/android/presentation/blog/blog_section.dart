import 'package:flutter/material.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Social Media',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Text(
                  'Follow me on my social media networks',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          Scrollbar(
            controller: scrollController,
            thumbVisibility: false,
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
