import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameCtrl = TextEditingController(text: 'Пользователь');
  final TextEditingController statusCtrl = TextEditingController(text: 'Онлайн');
  String avatarUrl = 'https://picsum.photos/200';

  @override
  void dispose() {
    nameCtrl.dispose();
    statusCtrl.dispose();
    super.dispose();
  }

  void randomizeAvatar() {
    setState(() {
      avatarUrl = 'https://picsum.photos/200?rand=${DateTime.now().millisecondsSinceEpoch}';
    });
  }

  void save() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Сохранено: ${nameCtrl.text}, ${statusCtrl.text}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Профиль')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 48, backgroundImage: NetworkImage(avatarUrl)),
            SizedBox(height: 12),
            TextButton(onPressed: randomizeAvatar, child: Text('Сменить аватар')),
            SizedBox(height: 12),
            TextField(controller: nameCtrl, decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Шейченко Мария Александровна')),
            SizedBox(height: 12),
            TextField(controller: statusCtrl, decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Статус')),
            SizedBox(height: 12),
            ElevatedButton(onPressed: save, child: Text('Сохранить')),
          ],
        ),
      ),
    );
  }
}