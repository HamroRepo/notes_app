import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/note_notifier.dart';

class NotesList extends StatelessWidget {
  final dateFormat = DateFormat().add_yMMMMd();

  String convertToDate(DateTime date) {
    return dateFormat.format(date);
  }

  Color noteColor(int priority) {
    if (priority == 0)
      return Colors.greenAccent;
    else if (priority == 1)
      return Colors.yellowAccent;
    else if (priority == 2)
      return Colors.redAccent;
    else
      return Colors.greenAccent;
  }

  void deleteNote(note, index, context) {
    var currentNote = note.currentNotes[index];

    showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete'),
          content: Text('Do you want to delete this note?'),
          actions: [
            TextButton(
                onPressed: () {
                  note.delNote(currentNote);
                  Navigator.pop(context);
                },
                child: Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final int noteListLength =
        context.watch<NoteNotifier>().currentNotes.length;
    if (noteListLength == 0)
      return Text(
        'No notes here😪😪😪',
        style: ThemeData.dark().textTheme.headline6!.copyWith(fontSize: 36),
      );
    else
      return ListView.builder(
        itemCount: noteListLength,
        itemBuilder: (context, int index) {
          return Consumer<NoteNotifier>(
            builder: (context, note, child) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onLongPress: () {
                  // var currentNote = note.currentNotes[index];
                  deleteNote(note, index, context);
                },
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: noteColor(note.currentNotes[index].priority),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        note.currentNotes[index].title,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        note.currentNotes[index].body,
                        maxLines: 3,
                        overflow: TextOverflow
                            .ellipsis, // if i update onTap to view the whole note later
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        convertToDate(note.currentNotes[index].date),
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
  }
}
