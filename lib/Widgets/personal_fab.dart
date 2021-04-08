import 'package:flutter/material.dart';
import 'package:note_taking_app/data_provider.dart';
import 'package:provider/provider.dart';

class PersonalFAB extends StatelessWidget {
  PersonalFAB({this.title, this.text});

  final title;
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 45,
          width: 50,
          child: FloatingActionButton(
            onPressed: () {
              Provider.of<DataProvider>(context, listen: false)
                  .insertNote(title: title, text: text);
              Navigator.pop(context);
            },
            backgroundColor: Color(0xFF62686E),
            elevation: 10.0,
            child: Icon(
              Icons.add,
              size: 20.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
