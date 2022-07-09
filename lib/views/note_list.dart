import 'package:consuming_rest_api/models/note_for_listing.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final notes = [
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

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List of Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: Colors.green),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              notes[index].noteTile!,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: Text(
                'Last edited on ${formatDateTime(notes[index].lastEditDateTime!)}'),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
