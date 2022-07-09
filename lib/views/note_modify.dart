import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Note')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            Container(
              height: 8,
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
            Container(height: 16),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
