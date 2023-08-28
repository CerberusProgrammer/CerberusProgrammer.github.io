import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';

class AdminBlogScreen extends StatelessWidget {
  const AdminBlogScreen({super.key});

  EditorStyle customizeEditorStyle() {
    return const EditorStyle.mobile().copyWith(
      cursorColor: Colors.green,
      selectionColor: Colors.green[100],
    );
  }

  @override
  Widget build(BuildContext context) {
    final editorState = EditorState.blank(withInitialText: true);

    final editor = AppFlowyEditor(
      editorState: editorState,
      contextMenuItems: [
        [
          ContextMenuItem(
            name: 'name',
            onPressed: (editorState) {},
          )
        ]
      ],
    );

    return MaterialApp(
      localizationsDelegates: const [
        AppFlowyEditorLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Text Editor'),
          ),
          body: Center(
            child: editor,
          )),
    );
  }
}
