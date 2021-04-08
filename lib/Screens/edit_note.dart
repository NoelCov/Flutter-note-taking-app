import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/data_provider.dart';
import 'package:provider/provider.dart';

class EditNote extends StatefulWidget {
  EditNote({this.title, this.text});

  final String title;
  final String text;

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  var titleController = TextEditingController();
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    textController = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 45,
        width: 50,
        child: FloatingActionButton(
          onPressed: () {
            Provider.of<DataProvider>(context, listen: false).updateNote(
                title: titleController.text,
                text: textController.text,
                oldTitle: widget.title);
            Navigator.pop(context);
          },
          backgroundColor: Color(0xFF62686E),
          elevation: 10.0,
          child: Icon(
            Icons.update_rounded,
            size: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color(0xFF393E43),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 40.0, right: 40.0, top: 80, bottom: 100),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              maxLines: 1,
              maxLength: 30,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Roboto',
                letterSpacing: 1,
              ),
              decoration: InputDecoration(border: InputBorder.none),
            ),
            SizedBox(height: 30),
            Expanded(
              child: TextField(
                controller: textController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  letterSpacing: 1,
                ),
                decoration: InputDecoration(
                    hintText: '${widget.text}', border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
