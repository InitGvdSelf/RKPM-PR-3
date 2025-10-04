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
    final banner = Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Row(
        children: [
          Text('Общие настройки', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Spacer(),
          TextButton(onPressed: () {}, child: Text('Справка')),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Настройки')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            banner,
            SizedBox(height: 12),
            Expanded(
              child: ListView(
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
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(onPressed: () {}, child: Text('Применить'))),
                      SizedBox(width: 8),
                      Expanded(child: OutlinedButton(onPressed: () {}, child: Text('Сбросить'))),
                    ],
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