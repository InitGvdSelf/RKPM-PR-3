import 'package:flutter/material.dart';

class TextButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('TextButton нажата!');
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: Text('Дополнительное действие'),
    );
  }
}