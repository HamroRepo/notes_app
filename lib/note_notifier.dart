import 'package:flutter/material.dart';

class NoteNotifier extends ChangeNotifier {
  List<Note> currentNotes = [
    Note(
      title: 'Creating a notes app',
      body: 'We need to be able to create, update, delete and read',
      date: DateTime(2021, 10, 17),
      priority: 1,
    ),
    Note(
      title: 'Creating a notes app',
      body: 'We need to be able to create, update, delete and read',
      date: DateTime(2021, 10, 17),
      priority: 1,
    ),
    Note(
      title: 'Creating a notes app',
      body: 'We need to be able to create, update, delete and read',
      date: DateTime(2021, 10, 17),
      priority: 1,
    ),
    Note(
      title: 'Creating a notes app',
      body: 'We need to be able to create, update, delete and read',
      date: DateTime(2021, 10, 17),
      priority: 1,
    ),
  ];

  void addNote(Note note) {
    currentNotes.add(note);
    notifyListeners();
  }
}

class Note {
  final String title;
  final String body;
  final DateTime date;
  final int priority; // 1 is lowest and 3 is highest

  Note(
      {required this.title,
      required this.body,
      required this.date,
      required this.priority});

  @override
  String toString() {
    return 'Note(title: $title, body: $body, date: $date, priority: $priority)';
  }
}
//
// final exampleNote = Note(
//   title: 'Creating a notes app',
//   body: 'We need to be able to create, update, delete and read',
//   date: DateTime(2021, 10, 17),
//   priority: 1,
// );
