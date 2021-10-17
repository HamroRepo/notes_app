import 'package:flutter/material.dart';
import 'package:notes_app/note.dart';

class NoteNotifier extends ChangeNotifier {
  List<Note> currentNotes = [
    // Note(
    //   title: 'Creating a notes app first',
    //   body:
    //       'We need to be able to create, update, delete and read We need to be able to create, update, delete and read We need to be able to create, update, delete and read We need to be able to create, update, delete and read',
    //   date: DateTime(2021, 10, 17),
    //   priority: 1,
    // ),
    // Note(
    //   title: 'Creating a notes app',
    //   body: 'We need to be able to create, update, delete and read',
    //   date: DateTime(2021, 10, 17),
    //   priority: 2,
    // ),
    // Note(
    //   title: 'Creating a notes app',
    //   body: 'We need to be able to create, update, delete and read',
    //   date: DateTime(2021, 10, 17),
    //   priority: 3,
    // ),
    // Note(
    //   title: 'Creating a notes app',
    //   body: 'We need to be able to create, update, delete and read',
    //   date: DateTime(2021, 10, 17),
    //   priority: 1,
    // ),
    // Note(
    //   title: 'Creating a notes app',
    //   body: 'We need to be able to create, update, delete and read',
    //   date: DateTime(2021, 10, 17),
    //   priority: 1,
    // ),
    // Note(
    //   title: 'Creating a notes app',
    //   body: 'We need to be able to create, update, delete and read',
    //   date: DateTime(2021, 10, 17),
    //   priority: 1,
    // ),
  ];

  void addNote(Note note) {
    currentNotes.add(note);
    notifyListeners();
  }

  void delNote(Note note) {
    currentNotes.remove(note);
    notifyListeners();
  }
}

//
// final exampleNote = Note(
//   title: 'Creating a notes app',
//   body: 'We need to be able to create, update, delete and read',
//   date: DateTime(2021, 10, 17),
//   priority: 1,
// );
