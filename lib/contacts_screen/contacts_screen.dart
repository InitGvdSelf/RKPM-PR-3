import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final List<String> contacts = [
    'Андрей Петров',
    'Мария Сидорова',
    'Кирилл Орлов',
    'Анна Кузнецова',
    'Сергей Смирнов'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Контакты')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(contacts[index]),
          );
        },
      ),
    );
  }
}