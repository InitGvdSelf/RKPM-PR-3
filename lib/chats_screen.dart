import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final List<String> chats = ['Общий чат', 'Работа', 'Семья'];
  final Map<String, List<String>> messages = {
    'Общий чат': ['Добро пожаловать в чат'],
    'Работа': ['Встреча в 10:00'],
    'Семья': ['Ужин в 19:00']
  };
  String current = 'Общий чат';
  final TextEditingController inputCtrl = TextEditingController();

  @override
  void dispose() {
    inputCtrl.dispose();
    super.dispose();
  }

  void send() {
    final text = inputCtrl.text.trim();
    if (text.isEmpty) return;
    setState(() {
      messages[current]!.add(text);
      inputCtrl.clear();
    });
  }

  void addChat() {
    final name = 'Новый чат ${chats.length + 1}';
    setState(() {
      chats.add(name);
      messages[name] = ['Чат создан'];
      current = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = messages[current] ?? [];
    return Scaffold(
      appBar: AppBar(title: Text('Чаты')),
      body: Row(
        children: [
          Container(
            width: 140,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, i) {
                      final c = chats[i];
                      return ListTile(
                        title: Text(c),
                        selected: c == current,
                        onTap: () => setState(() => current = c),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: OutlinedButton(onPressed: addChat, child: Text('Новый чат')),
                ),
              ],
            ),
          ),
          VerticalDivider(width: 1),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(12),
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      return Align(
                        alignment: i.isEven ? Alignment.centerLeft : Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: i.isEven ? Colors.grey.shade300 : Colors.lightBlue.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(list[i]),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: inputCtrl,
                          decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Сообщение'),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(onPressed: send, child: Text('Отправить')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}