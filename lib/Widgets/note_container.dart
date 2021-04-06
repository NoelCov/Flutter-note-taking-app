import 'package:flutter/material.dart';

class NoteContainer extends StatelessWidget {
  NoteContainer({@required this.noteTitle});

  final String noteTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF393E43),
      ),
      child: ListTile(
        title: Text(noteTitle),
        onTap: () {
          //TODO Open this note on big screen!
        },
        trailing: GestureDetector(
          child: Icon(Icons.edit),
          onTap: () {
            //TODO Edit this note!
          },
        ),
      ),
    );
  }
}