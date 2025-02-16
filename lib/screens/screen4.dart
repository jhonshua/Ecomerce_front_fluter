import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 4'),
      ),
      body: Center(
        child: Text('Esta es la Pantalla 4'),
      ),
    );
  }
}