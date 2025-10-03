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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen())),
              child: Text('Профиль'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen())),
              child: Text('Настройки'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatsScreen())),
              child: Text('Чаты'),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DocsScreen())),
              child: Text('Документация'),
            ),
          ],
        ),
      ),
    );
  }
}