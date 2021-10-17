import 'package:flutter/material.dart';
import 'package:notes_app/note_notifier.dart';
import 'package:notes_app/notes_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteNotifier(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.blueGrey.shade800,
        ),
        home: NotesApp(),
      ),
    );
  }
}
