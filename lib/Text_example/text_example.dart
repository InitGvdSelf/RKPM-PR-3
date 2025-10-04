import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Пример текста во Flutter',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        letterSpacing: 2,
      ),
    );
  }
}