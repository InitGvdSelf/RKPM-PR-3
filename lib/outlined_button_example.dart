import 'package:flutter/material.dart';

class OutlinedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        print('OutlinedButton нажата!');
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.blue, width: 2), // обводка
        foregroundColor: Colors.blue, // цвет текста
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // скругленные углы
        ),
      ),
      child: Text('Второстепенное действие'),
    );
  }
}