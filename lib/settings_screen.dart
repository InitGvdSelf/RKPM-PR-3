import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;
  bool sounds = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Настройки')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Тёмная тема'),
            value: darkMode,
            onChanged: (v) => setState(() => darkMode = v),
          ),
          SwitchListTile(
            title: Text('Уведомления'),
            value: notifications,
            onChanged: (v) => setState(() => notifications = v),
          ),
          SwitchListTile(
            title: Text('Звуки'),
            value: sounds,
            onChanged: (v) => setState(() => sounds = v),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Изменения применяются в рамках текущего экрана.'),
          ),
        ],
      ),
    );
  }
}