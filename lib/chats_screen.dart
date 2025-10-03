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
    final sidebar = Container(
      width: 160,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(right: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('Чаты', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
              TextButton(onPressed: addChat, child: Text('Добавить')),
            ],
          ),
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
        ],
      ),
    );

    final list = messages[current] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('Чаты')),
      body: Row(
        children: [
          sidebar,
          Expanded(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  color: Colors.lightBlue.shade50,
                  child: Row(
                    children: [
                      Text(current, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Spacer(),
                      OutlinedButton(onPressed: () {}, child: Text('Поиск')),
                    ],
                  ),
                ),
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