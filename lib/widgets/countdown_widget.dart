import 'package:flutter/material.dart';
import 'dart:async'; // Para usar Timer
import '../utils/app_textstyles.dart'; // Importa los estilos de texto

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({Key? key}) : super(key: key);

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  // Duración inicial del conteo regresivo (60 horas)
  Duration _duration = Duration(hours: 60);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer(); // Inicia el conteo regresivo
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el temporizador al destruir el widget
    super.dispose();
  }

  // Método para iniciar el temporizador
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_duration.inSeconds > 0) {
        setState(() {
          _duration = _duration - Duration(seconds: 1);
        });
      } else {
        _timer?.cancel(); // Detiene el temporizador cuando llega a 0
      }
    });
  }

  // Método para formatear el tiempo (horas, minutos, segundos)
  String _formatTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    // Obtener horas, minutos y segundos
    int hours = _duration.inHours;
    int minutes = _duration.inMinutes.remainder(60);
    int seconds = _duration.inSeconds.remainder(60);

    return Column(
      children: [
        // Texto "SALE"
        Text(
          "SALE",
          style: AppTextStyle.h2.copyWith(
            color: Colors.orange, // Color naranja
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        // Reloj de cuenta regresiva
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Horas
            _buildTimeBox(_formatTime(hours), "H"),
            const SizedBox(width: 10),
            // Minutos
            _buildTimeBox(_formatTime(minutes), "M"),
            const SizedBox(width: 10),
            // Segundos
            _buildTimeBox(_formatTime(seconds), "S"),
          ],
        ),
      ],
    );
  }

  // Método para construir cada caja de tiempo
  Widget _buildTimeBox(String time, String label) {
    return Column(
      children: [
        // Caja con el tiempo
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200], // Fondo gris suave
            borderRadius: BorderRadius.circular(10), // Esquinas curvas
          ),
          child: Text(
            time,
            style: AppTextStyle.h2.copyWith(
              fontWeight: FontWeight.bold, // Texto en negrita
              color: Colors.black, // Color del texto
            ),
          ),
        ),
        const SizedBox(height: 5),
        // Etiqueta (H, M, S)
        Text(
          label,
          style: AppTextStyle.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}