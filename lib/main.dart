import 'package:flutter/material.dart';
import 'package:note_taking_app/Screens/home_screen.dart';
import 'package:note_taking_app/Screens/add_note.dart';
import 'package:note_taking_app/data_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/add_note': (context) => AddNote(),
        },
      ),
    );
  }
}
