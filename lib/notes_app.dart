import 'package:flutter/material.dart';
import 'package:notes_app/notes_entry_page.dart';
import 'package:notes_app/notes_list.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final noteNotifier = Provider.of<NoteNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: NotesList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit_outlined),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NoteEntryPage(),
            ),
          );
        },
      ),
    );
  }
}
