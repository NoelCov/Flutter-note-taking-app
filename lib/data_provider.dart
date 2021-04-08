import 'package:flutter/cupertino.dart';
import 'package:note_taking_app/database_helper.dart';
import 'package:note_taking_app/Models/note.dart';

class DataProvider extends ChangeNotifier {

  final db = DBHelper.instance;
  Future<List<Note>> notes;

  Future<List<Note>> getNoteList() async {
    return await db.getNoteList();
  }


  void insertNote({String title, String text}) {
    db.insertNote(Note(
      title: title,
      text: text
    ));
    notifyListeners();
  }

  void updateNote({String title, String text, String oldTitle}){
    db.updateNote(Note(
      title: title,
      text: text
    ), oldTitle);
    notifyListeners();
  }

  void deleteNote(title){
    db.deleteNote(title);
    notifyListeners();
  }
}