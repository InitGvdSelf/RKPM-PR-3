import 'package:flutter/material.dart';

class CallSettingsScreen extends StatefulWidget {
  @override
  State<CallSettingsScreen> createState() => _CallSettingsScreenState();
}

class _CallSettingsScreenState extends State<CallSettingsScreen> {
  bool vibrateOnRing = true;
  bool showCallerId = true;
  bool blockUnknown = false;
  final TextEditingController forwardNumber = TextEditingController();

  @override
  void dispose() {
    forwardNumber.dispose();
    super.dispose();
  }

  void applyForwarding() {
    final n = forwardNumber.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(n.isEmpty ? 'Переадресация отключена' : 'Переадресация на: $n')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Настройки звонков')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Вибрация при звонке'),
            value: vibrateOnRing,
            onChanged: (v) => setState(() => vibrateOnRing = v),
          ),
          SwitchListTile(
            title: Text('Показывать мой номер'),
            value: showCallerId,
            onChanged: (v) => setState(() => showCallerId = v),
          ),
          SwitchListTile(
            title: Text('Блокировать неизвестные номера'),
            value: blockUnknown,
            onChanged: (v) => setState(() => blockUnknown = v),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Переадресация'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: forwardNumber,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Номер'),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(onPressed: applyForwarding, child: Text('Применить')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}