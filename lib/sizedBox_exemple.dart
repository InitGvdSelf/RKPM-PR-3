import 'package:flutter/material.dart';

class SizedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Кнопка в SizedBox'),
      ),
    );
  }
}