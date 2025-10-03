import 'package:flutter/material.dart';
import 'text_example.dart';
import 'button_example.dart';
import 'outlined_button_example.dart';
import 'text_button_example.dart';
import 'column_example.dart';
import 'row_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Пример Flutter виджетов')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextExample(),
                SizedBox(height: 30),
                ButtonExample(),
                SizedBox(height: 30),
                OutlinedButtonExample(),
                SizedBox(height: 30),
                TextButtonExample(),
                SizedBox(height: 30),
                ColumnExample(),
                SizedBox(height: 30),
                RowExample(), // ✅ добавили пример Row
              ],
            ),
          ),
        ),
      ),
    );
  }
}