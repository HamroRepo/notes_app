import 'package:flutter/material.dart';
import 'package:notes_app/note.dart';
import 'package:notes_app/note_notifier.dart';
import 'package:provider/provider.dart';

class NoteEntryPage extends StatelessWidget {
  const NoteEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final noteNotifier = Provider.of<NoteNotifier>(context);

    final priority = ValueNotifier(1);
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    void priorityValue(value) {
      priority.value = value;
    }

    String priorityString(priority) {
      if (priority == 0)
        return 'Mehhh!';
      else if (priority == 1)
        return 'Imp';
      else if (priority == 2)
        return 'Very Important!';
      else
        return 'Mehhh!';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Theme(
        data: ThemeData.dark(),
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(),
                  // ),
                  hintText: 'Title',
                ),
                controller: titleController,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<int>(
                value: priority.value,
                icon: Text('Priority'),
                items: List.generate(
                  3,
                  (index) => DropdownMenuItem(
                    value: index,
                    // child: Text((index + 1).toString()),
                    child: Text(priorityString(index)),
                  ),
                ),
                onChanged: priorityValue,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Taking note of...',
                ),
                controller: bodyController,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit_outlined),
        onPressed: () {
          final note = Note(
            title: titleController.text,
            body: bodyController.text,
            priority: priority.value,
            date: DateTime.now(),
          );
          context.read<NoteNotifier>().addNote(note);

          // print(note.toString());
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
