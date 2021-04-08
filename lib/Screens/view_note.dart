import 'package:flutter/material.dart';

class ViewNote extends StatelessWidget {
  ViewNote({this.title, this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                '$title',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Text(
                '$text',
                style: TextStyle(fontSize: 16, letterSpacing: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
