import 'package:flutter/material.dart';

class PaddingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            color: Colors.red,
            child: Text(
              'Отступ all(20)',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            color: Colors.green,
            child: Text(
              'Отступ symmetric(horizontal: 40)',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Container(
            color: Colors.blue,
            child: Text(
              'Отступ symmetric(vertical: 30)',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50, top: 10),
          child: Container(
            color: Colors.orange,
            child: Text(
              'Отступ only(left: 50, top: 10)',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}