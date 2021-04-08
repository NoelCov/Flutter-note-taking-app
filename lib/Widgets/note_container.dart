import 'package:flutter/material.dart';
import 'package:note_taking_app/Screens/view_note.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_taking_app/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:note_taking_app/Screens/edit_note.dart';

class NoteContainer extends StatelessWidget {
  NoteContainer({@required this.noteTitle, this.noteText});

  final String noteTitle;
  final String noteText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0x35393E43),
      ),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: ListTile(
          title: Text(noteTitle),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ViewNote(title: noteTitle, text: noteText),
              ),
            );
          },
          trailing: GestureDetector(
            child: Icon(Icons.edit),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditNote(title: noteTitle, text: noteText),
                ),
              );
            },
          ),
        ),
        secondaryActions: [
          IconSlideAction(
            color: Color(0x00393E43),
            caption: 'Delete',
            icon: Icons.delete,
            onTap: () {
              Provider.of<DataProvider>(context, listen: false)
                  .deleteNote(noteTitle);
            },
          ),
        ],
      ),
    );
  }
}
