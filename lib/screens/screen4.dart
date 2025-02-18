import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? 'Login' : 'Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            if (!isLogin) ...[
              TextField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {}, 
              child: Text(isLogin ? 'Login' : 'Register'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(
                isLogin ? 'Dont have an account? Register' : 'Already have an account? Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
