import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

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
              'Hello',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: const Text('Lest edited on 21/2/2021'),
          );
        },
        itemCount: 30,
      ),
    );
  }
}
