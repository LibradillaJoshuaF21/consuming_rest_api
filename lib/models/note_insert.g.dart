// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_insert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteManupulation _$NoteManupulationFromJson(Map<String, dynamic> json) =>
    NoteManupulation(
      noteTitle: json['noteTitle'] as String?,
      noteContent: json['noteContent'] as String?,
    );

Map<String, dynamic> _$NoteManupulationToJson(NoteManupulation instance) =>
    <String, dynamic>{
      'noteTitle': instance.noteTitle,
      'noteContent': instance.noteContent,
    };
