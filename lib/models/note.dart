class Note {
  String? noteID;
  String? noteTile;
  String? noteContent;
  DateTime? createDateTime;
  DateTime? lastEditDateTime;

  Note(
      {this.noteID,
      this.noteTile,
      this.noteContent,
      this.createDateTime,
      this.lastEditDateTime});

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
      noteID: item['noteID'],
      noteTile: item['noteTitle'],
      noteContent: item['noteContent'],
      createDateTime: DateTime.parse(item['createDateTime']),
      lastEditDateTime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
