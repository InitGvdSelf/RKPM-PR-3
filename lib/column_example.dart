import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Демонстрация Column',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Версия: 2.1.4',
                style: TextStyle(fontSize: 14, color: Colors.deepOrange),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Краткое описание:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Text(
          'Пример использования контейнера Column для расположения текста и кнопок.',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 80,
                color: Colors.blue.shade100,
                child: Center(
                  child: Text('Левый блок'),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 80,
                color: Colors.green.shade100,
                child: Center(
                  child: Text('Правый блок'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}