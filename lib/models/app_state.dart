import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  // Datos que quieres almacenar globalmente
  String _userName = "Invitado";
  int _counter = 0;

  // Getters para acceder a los datos
  String get userName => _userName;
  int get counter => _counter;

  // Métodos para actualizar los datos
  void setUserName(String name) {
    _userName = name;
    notifyListeners(); // Notifica a los widgets que los datos han cambiado
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }
}