import 'dart:convert';

import 'package:consuming_rest_api/models/api_response.dart';
import 'package:consuming_rest_api/models/note.dart';
import 'package:consuming_rest_api/models/note_for_listing.dart';
import 'package:consuming_rest_api/models/note_insert.dart';
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
          notes.add(NoteForListing.fromJson(item));
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
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: 'An error occured');
    }).catchError(
        (_) => APIResponse<Note>(error: true, errorMessage: 'An error occurs'));
  }

  Future<APIResponse<bool>> createNote(NoteInsert item) {
    return http
        .post(Uri.parse(api + '/notes'), headers: headers, body: item.toJson())
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occurs'));
  }
}
