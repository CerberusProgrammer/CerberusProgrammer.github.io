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
    String markdownText = blog.markdownContent;
    String content = markdownText.replaceAll('\\n', """

""");

    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: width > 900
          ? _BodyLandscape(content: content)
          : _BodyPortrait(content: content),
    );
  }
}

class _BodyLandscape extends StatelessWidget {
  const _BodyLandscape({
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _ProfileSection(),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Markdown(
                  shrinkWrap: true,
                  data: content,
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(
                    h1: const TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                    ),
                    h1Padding:
                        const EdgeInsets.only(bottom: 16, top: 16, right: 96),
                    h2: const TextStyle(
                      fontSize: 24,
                    ),
                    h3: const TextStyle(
                      fontSize: 18,
                    ),
                    code: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.bold,
                    ),
                    codeblockDecoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    codeblockPadding: const EdgeInsets.all(32),
                    pPadding: const EdgeInsets.only(right: 96),
                    h2Padding: const EdgeInsets.only(right: 96),
                    h3Padding: const EdgeInsets.only(right: 96),
                    h4Padding: const EdgeInsets.only(right: 96),
                    blockquotePadding: const EdgeInsets.only(right: 96),
                    listBulletPadding: const EdgeInsets.only(right: 96),
                    tableCellsPadding: const EdgeInsets.only(right: 96),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BodyPortrait extends StatelessWidget {
  const _BodyPortrait({
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 32,
                  ),
                  child: Markdown(
                    shrinkWrap: true,
                    data: content,
                    selectable: true,
                    styleSheet: MarkdownStyleSheet(
                      h1: const TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                      ),
                      h1Padding: const EdgeInsets.only(
                          bottom: 16, right: 32, left: 32),
                      h2: const TextStyle(
                        fontSize: 24,
                      ),
                      h3: const TextStyle(
                        fontSize: 18,
                      ),
                      code: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                      ),
                      codeblockDecoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      codeblockPadding: const EdgeInsets.all(16),
                      pPadding: const EdgeInsets.only(right: 32, left: 32),
                      h2Padding: const EdgeInsets.only(right: 32, left: 32),
                      h3Padding: const EdgeInsets.only(right: 32, left: 32),
                      h4Padding: const EdgeInsets.only(right: 32, left: 32),
                      blockquotePadding:
                          const EdgeInsets.only(right: 32, left: 32),
                      listBulletPadding:
                          const EdgeInsets.only(right: 32, left: 32),
                      tableCellsPadding:
                          const EdgeInsets.only(right: 32, left: 32),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const _ProfileSection(),
      ],
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 96, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              CircleAvatar(
                child: Text("OF"),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  Text(
                    'Omar Flores Salazar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Full Stack developer',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Buy me a coffee'),
          ),
        ],
      ),
    );
  }
}
