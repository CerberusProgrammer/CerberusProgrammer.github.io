import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';

class AdminBlogScreen extends StatelessWidget {
  const AdminBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final document = MutableDocument(
      nodes: [
        ParagraphNode(
          id: DocumentEditor.createNodeId(),
          text: AttributedText(text: 'This is some text.'),
        ),
      ],
    );
    final editor = DocumentEditor(document: document);

    return MaterialApp(
      home: Scaffold(
        body: SuperEditor(
          editor: editor,
        ),
      ),
    );
  }
}
