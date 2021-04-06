import 'package:flutter/cupertino.dart';
import 'package:note_taking_app/database_helper.dart';
import 'package:note_taking_app/Models/note.dart';

class DataProvider extends ChangeNotifier {

  final db = DBHelper.instance;

  void insertNote({String title, String text}) {
    db.insertNote(Note(
      title: title,
      text: text
    ));
    notifyListeners();
  }


}