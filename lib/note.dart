import 'package:flutter/material.dart';

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
