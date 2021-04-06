import 'package:flutter/material.dart';
import 'package:note_taking_app/Widgets/personal_fab.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PersonalFAB(
        title: title,
        text: text,
      ),
      backgroundColor: Color(0xFF393E43),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 40.0, right: 40.0, top: 80, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (titleNewValue) {
                setState(() {
                  title = titleNewValue;
                });
              },
              maxLines: 1,
              maxLength: 30,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Roboto',
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                  hintText: 'Title goes here', border: InputBorder.none),
            ),
            SizedBox(height: 30.0),
            Expanded(
              child: TextField(
                onChanged: (textNewValue) {
                  setState(() {
                    text = textNewValue;
                  });
                },
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  letterSpacing: 1,
                ),
                decoration: InputDecoration(
                    hintText: 'Text goes here', border: InputBorder.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}
