import 'package:flutter/material.dart';
import 'package:note_taking_app/Widgets/note_container.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF79A89F),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              child: ListView.builder(itemBuilder: (context, index) {
                return NoteContainer(noteTitle: 'Note 1');
              }, itemCount: 1),
            ),
          ),
          TextButton.icon(
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
        ],
      ),
    );
  }
}
