import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'screens/splash_screen.dart'; // Importa la pantalla de inicio
import 'utils/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura la inicialización de Flutter antes de llamar a métodos async
  final appState = AppState();
  await appState.loadProducts(); // Cargar los productos antes de iniciar la app

  runApp(
    ChangeNotifierProvider(
      create: (context) => appState, // Pasa el AppState inicializado
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
      home: SplashScreen(), // Mantiene la pantalla de inicio como la inicial
      debugShowCheckedModeBanner: false, // Oculta la cinta de debug
    );
  }
}
