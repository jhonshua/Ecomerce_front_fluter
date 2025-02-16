import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'screens/splash_screen.dart'; // Importa la pantalla de inicio
import 'utils/app_themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda',
      theme: AppThemes.light, // Usa el tema light
      darkTheme: AppThemes.dark, // Usa el tema dark
      home: SplashScreen(), // Cambia a SplashScreen como pantalla inicial
      debugShowCheckedModeBanner: false, // Esta línea elimina la cinta de debug
    );
  }
}