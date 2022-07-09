import 'package:consuming_rest_api/models/note_for_listing.dart';

class NotesSerivice {
  List<NoteForListing> getNoteList() {
    return [
      NoteForListing(
          noteID: "1",
          createDateTime: DateTime.now(),
          lastEditDateTime: DateTime.now(),
          noteTile: "Note 1"),
      NoteForListing(
          noteID: "2",
          createDateTime: DateTime.now(),
          lastEditDateTime: DateTime.now(),
          noteTile: "Note 2"),
      NoteForListing(
          noteID: "3",
          createDateTime: DateTime.now(),
          lastEditDateTime: DateTime.now(),
          noteTile: "Note 3"),
    ];
  }
}
