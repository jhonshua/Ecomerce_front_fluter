import 'package:flutter/material.dart';
import '/main_screen.dart'; // Importa MainScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Configura la animación
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // Duración de 1.5 segundos
    );

    _animation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Inicia la animación
    _controller.forward();

    // Redirige a MainScreen después de que la animación termine
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MainScreen(), // Redirige a MainScreen
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Limpia el controlador de animación
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF9800), // Naranja más claro
              Color(0xFFff5722), // Naranja más oscuro
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.shopping_bag, // Icono de bolso
                    size: 80,
                    color: Color(0xFFff5722), // Naranja para el icono
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Fashion',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Store',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40), // Espacio hasta el final
              const Text(
                'Fashion and Style Store',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}