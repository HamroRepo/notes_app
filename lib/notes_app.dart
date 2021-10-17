import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/notes_entry_page.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/note_notifier.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteNotifier = Provider.of<NoteNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            /// try and use listview builder
            for (var note in noteNotifier.currentNotes)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    // margin: EdgeInsets.only(bottom: 18.0),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.yellowAccent.shade400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(note.title),
                            Text('❗' * note.priority),
                          ],
                        ),
                        Text(note.body),
                        Text(
                          convertToDate(note.date),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
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

final dateFormat = DateFormat().add_yMMMMd();
String convertToDate(DateTime date) {
  return dateFormat.format(date);
}

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
