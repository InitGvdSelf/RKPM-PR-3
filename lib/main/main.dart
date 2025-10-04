import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'chats_screen.dart';
import 'docs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String appTitle = 'Телефонное приложение';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(title: appTitle),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  Widget _card(String title, String subtitle, VoidCallback onTap) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 6),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: ElevatedButton(onPressed: onTap, child: Text('Открыть'))),
              SizedBox(width: 8),
              Expanded(child: OutlinedButton(onPressed: onTap, child: Text('Подробнее'))),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final header = Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      color: Colors.blue.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Шейченко Мария Александровна', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('Группа: ИКБО-12-22', style: TextStyle(fontSize: 16, color: Colors.black54)),
          SizedBox(height: 8),
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text('Профиль')),
              SizedBox(width: 8),
              TextButton(onPressed: () {}, child: Text('Справка')),
            ],
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            header,
            SizedBox(height: 16),
            _card('Профиль', 'Данные пользователя и статус', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
            }),
            SizedBox(height: 12),
            _card('Настройки', 'Параметры интерфейса и уведомлений', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen()));
            }),
            SizedBox(height: 12),
            _card('Чаты', 'Список бесед и сообщения', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ChatsScreen()));
            }),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Row(
                children: [
                  Expanded(child: Text('Документация пользователя')),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DocsScreen())),
                    child: Text('Открыть'),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DocsScreen())),
                    child: Text('Читать'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}