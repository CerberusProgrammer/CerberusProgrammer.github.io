import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../domain/blog/blog.dart';

class BlogRead extends StatelessWidget {
  final Blog blog;
  const BlogRead({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    String text = blog.markdownContent.replaceAll('\\n', '\n');

    return Scaffold(
      appBar: AppBar(),
      body: Markdown(
        controller: scrollController,
        selectable: true,
        data: text,
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
      ),
    );
  }
}
