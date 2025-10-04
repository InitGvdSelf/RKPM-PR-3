import 'package:flutter/material.dart';

class DocsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sections = [
      {'title': 'Назначение', 'text': 'Приложение демонстрирует экраны: профиль, настройки, чаты и встроенную документацию.'},
      {'title': 'Навигация', 'text': 'Главный экран содержит кнопки для перехода по разделам. Возврат выполняется стрелкой назад.'},
      {'title': 'Профиль', 'text': 'Изменение имени и статуса, обновление аватара, сохранение данных в текущем сеансе.'},
      {'title': 'Настройки', 'text': 'Переключение темы, уведомлений и звуков. Изменения применяются мгновенно.'},
      {'title': 'Чаты', 'text': 'Выбор беседы, создание новых чатов и отправка сообщений.'},
      {'title': 'Ограничения', 'text': 'Данные не сохраняются между перезапусками и предназначены для учебной демонстрации.'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Документация')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Row(
                children: [
                  Expanded(child: Text('Пользовательская документация', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
                  SizedBox(width: 8),
                  ElevatedButton(onPressed: () {}, child: Text('Экспорт')),
                  SizedBox(width: 8),
                  TextButton(onPressed: () {}, child: Text('Справка')),
                ],
              ),
            ),
            SizedBox(height: 12),
            for (final s in sections)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s['title']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(height: 6),
                      Text(s['text']!),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          OutlinedButton(onPressed: () {}, child: Text('Подробнее')),
                          SizedBox(width: 8),
                          TextButton(onPressed: () {}, child: Text('Открыть раздел')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}