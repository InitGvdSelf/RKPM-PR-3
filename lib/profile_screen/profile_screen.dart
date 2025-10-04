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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Сохранено: ${nameCtrl.text}, ${statusCtrl.text}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Профиль')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 32, backgroundImage: NetworkImage(avatarUrl)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Профиль пользователя',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Редактирование имени и статуса',
                          style: TextStyle(color: Colors.black54),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 120, maxWidth: 150),
                    child: TextButton.icon(
                      onPressed: randomizeAvatar,
                      icon: Icon(Icons.refresh),
                      label: FittedBox(fit: BoxFit.scaleDown, child: Text('Сменить аватар')),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: nameCtrl,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Имя'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: statusCtrl,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Статус'),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: save, child: Text('Сохранить'))),
                SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () { nameCtrl.clear(); statusCtrl.clear(); },
                    child: Text('Сбросить'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}