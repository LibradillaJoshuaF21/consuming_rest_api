import 'package:flutter/foundation.dart';

class NoteManupulation {
  String? noteTitle;
  String? noteContent;

  NoteManupulation({
    @required this.noteTitle,
    @required this.noteContent,
  });

  Map<String, dynamic> toJson() {
    return {
      "noteTitle": noteTitle,
      "noteContent": noteContent,
    };
  }
}
