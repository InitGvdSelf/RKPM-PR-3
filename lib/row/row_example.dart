import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          color: Colors.red.shade200,
          child: Center(child: Text('1')),
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.blue.shade200,
          child: Center(child: Text('2')),
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.green.shade200,
          child: Center(child: Text('3')),
        ),
      ],
    );
  }
}