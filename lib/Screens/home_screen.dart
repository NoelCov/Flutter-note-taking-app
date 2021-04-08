import 'package:flutter/material.dart';
import 'package:note_taking_app/Widgets/notes_container.dart';
import 'package:note_taking_app/Models/note.dart';
import 'package:provider/provider.dart';
import 'package:note_taking_app/data_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Note>> notes;

  void updateNotesList() {
    setState(() {
      notes = Provider.of<DataProvider>(context).getNoteList();
    });
  }

  @override
  Widget build(BuildContext context) {
    updateNotesList();
    return Scaffold(
      backgroundColor: Color(0XFF79A89F),
      body: Column(
        children: [
          NotesContainer(notes: notes, updateList: updateNotesList),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/add_note');
              },
              label: Text(
                'ADD NOTES',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
