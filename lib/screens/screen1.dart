import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Usuario: ${appState.userName}'),
            SizedBox(height: 20),
            Text('Contador: ${appState.counter}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reinicia el contador
                appState.resetCounter();
              },
              child: Text('Reiniciar contador'),
            ),
          ],
        ),
      ),
    );
  }
}