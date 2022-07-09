import 'package:consuming_rest_api/models/api_response.dart';
import 'package:consuming_rest_api/models/note_for_listing.dart';
import 'package:consuming_rest_api/services/notes_services.dart';
import 'package:consuming_rest_api/views/note_delete.dart';
import 'package:consuming_rest_api/views/note_modify.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NoteList extends StatefulWidget {
  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesSerivice get service => GetIt.I<NotesSerivice>();

  APIResponse<List<NoteForListing>>? _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNoteList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('List of Notes')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NoteModify()));
          },
          child: const Icon(Icons.add),
        ),
        body: Builder(
          builder: (_) {
            if (_isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (_apiResponse!.error!) {
              return Center(child: Text(_apiResponse!.errorMessage!));
            }

            return ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, color: Colors.green),
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(_apiResponse!.data![index].noteID!),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context,
                        builder: (context) => const NoteDelete());
                    print(result);
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Align(
                      child: Icon(Icons.delete, color: Colors.white),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      _apiResponse!.data![index].noteTile!,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                        'Last edited on ${formatDateTime(_apiResponse!.data![index].lastEditDateTime ?? _apiResponse!.data![index].createDateTime!)}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NoteModify(
                              noteID: _apiResponse!.data![index].noteID!)));
                    },
                  ),
                );
              },
              itemCount: _apiResponse!.data!.length,
            );
          },
        ));
  }
}
