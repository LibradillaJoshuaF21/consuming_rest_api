import 'dart:convert';

import 'package:consuming_rest_api/models/api_response.dart';
import 'package:consuming_rest_api/models/note.dart';
import 'package:consuming_rest_api/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesSerivice {
  static const api = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {'apiKey': 'c3bfaa82-f600-4ded-a9f0-e0b0d0b92ec6'};

  Future<APIResponse<List<NoteForListing>>> getNoteList() {
    return http.get(Uri.parse(api + '/notes'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
            noteID: item['noteID'],
            noteTile: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            lastEditDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occurs');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occurs'));
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(Uri.parse(api + '/notes/' + noteID), headers: headers).then(
        (data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final note = Note(
          noteID: jsonData['noteID'],
          noteTile: jsonData['noteTitle'],
          noteContent: jsonData['noteContent'],
          createDateTime: DateTime.parse(jsonData['createDateTime']),
          lastEditDateTime: jsonData['latestEditDateTime'] != null
              ? DateTime.parse(jsonData['latestEditDateTime'])
              : null,
        );
        return APIResponse<Note>(data: note);
      }
      return APIResponse<Note>(error: true, errorMessage: 'An error occured');
    }).catchError(
        (_) => APIResponse<Note>(error: true, errorMessage: 'An error occurs'));
  }
}
