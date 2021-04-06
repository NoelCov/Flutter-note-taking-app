import 'package:flutter/cupertino.dart';

class Note {
  Note({@required this.title, @required this.text});

  String title;
  String text;

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map['noteTitle'] = title;
    map['noteText'] = text;
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['noteTitle'],
      text: map['noteText'],
    );
  }
}
