class NoteForListing {
  String? noteID;
  String? noteTile;
  DateTime? createDateTime;
  DateTime? lastEditDateTime;

  NoteForListing(
      {this.noteID, this.noteTile, this.createDateTime, this.lastEditDateTime});

  factory NoteForListing.fromJson(Map<String, dynamic> item) {
    return NoteForListing(
      noteID: item['noteID'],
      noteTile: item['noteTitle'],
      createDateTime: DateTime.parse(item['createDateTime']),
      lastEditDateTime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
