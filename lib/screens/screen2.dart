import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.favorite, size: 100, color: Colors.red),
            SizedBox(height: 20),
            Text(
              'Your favorite products will appear here',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
