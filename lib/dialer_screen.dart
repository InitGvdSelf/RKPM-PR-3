import 'package:flutter/material.dart';

class DialerScreen extends StatefulWidget {
  @override
  State<DialerScreen> createState() => _DialerScreenState();
}

class _DialerScreenState extends State<DialerScreen> {
  String number = '';
  final List<String> recent = [];

  void addDigit(String d) {
    setState(() {
      number += d;
    });
  }

  void backspace() {
    if (number.isEmpty) return;
    setState(() {
      number = number.substring(0, number.length - 1);
    });
  }

  void call() {
    if (number.isEmpty) return;
    setState(() {
      recent.insert(0, number);
      if (recent.length > 10) recent.removeLast();
      number = '';
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Звонок: ${recent.first}')));
  }

  Widget keypadButton(String label) {
    return ElevatedButton(
      onPressed: () => addDigit(label),
      child: Text(label, style: TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final keys = [
      ['1','2','3'],
      ['4','5','6'],
      ['7','8','9'],
      ['*','0','#'],
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Набор номера')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(number.isEmpty ? 'Введите номер' : number, style: TextStyle(fontSize: 28)),
            SizedBox(height: 16),
            Expanded(
              child: Column(
                children: [
                  for (var row in keys)
                    Expanded(
                      child: Row(
                        children: [
                          for (var k in row)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(6),
                                child: keypadButton(k),
                              ),
                            )
                        ],
                      ),
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: ElevatedButton(
                            onPressed: backspace,
                            style: ElevatedButton.styleFrom(),
                            child: Icon(Icons.backspace),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: ElevatedButton(
                            onPressed: call,
                            style: ElevatedButton.styleFrom(),
                            child: Icon(Icons.call),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Недавние', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: recent.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Icon(Icons.call_made),
                    title: Text(recent[i]),
                    onTap: () {
                      setState(() {
                        number = recent[i];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}