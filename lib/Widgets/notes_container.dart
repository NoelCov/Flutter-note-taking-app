import 'package:flutter/material.dart';
import 'package:note_taking_app/Widgets/note_container.dart';
import 'package:note_taking_app/Models/note.dart';

class NotesContainer extends StatelessWidget {
  NotesContainer({@required this.notes, @required this.updateList});

  final Future<List<Note>> notes;
  final Function updateList;

  @override
  Widget build(BuildContext context) {
    print(notes);
    return Expanded(
      child: FutureBuilder(
          future: notes,
          builder: (context, snapshot) {
            if (snapshot.data.length <= 0) {
              return Center(
                child: Text(
                  'No notes added yet',
                  style: TextStyle(fontSize: 30.0),
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Future error'),
              );
            }

            return Container(
              margin: EdgeInsets.only(top: 40),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return NoteContainer(
                      noteTitle: snapshot.data[index].title,
                      noteText: snapshot.data[index].text,
                  );
                },
              ),
            );
          }),
    );
  }
}
