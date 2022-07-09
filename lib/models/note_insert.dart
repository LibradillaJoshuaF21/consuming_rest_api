import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_insert.g.dart';

@JsonSerializable()
class NoteManupulation {
  String? noteTitle;
  String? noteContent;

  NoteManupulation({
    @required this.noteTitle,
    @required this.noteContent,
  });

  Map<String, dynamic> toJson() => _$NoteManupulationToJson(this);
}
