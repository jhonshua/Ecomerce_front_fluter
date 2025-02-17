import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'product_model.dart';

class AppState with ChangeNotifier {
  
  // 🔹 Estado del usuario
  String _userName = "Invitado";
  bool _isLoggedIn = false;

  // 🔹 Estado del carrito
  final List<Product> _cart = [];
  double _totalPrice = 0.0;

  // 🔹 Estado de los productos
  List<Product> _products = [];

  // 🔹 Getters
  String get userName => _userName;
  bool get isLoggedIn => _isLoggedIn;
  List<Product> get cart => List.unmodifiable(_cart);
  double get totalPrice => _totalPrice;
  List<Product> get products => List.unmodifiable(_products);

  // =======================================
  // ✅ CARGAR PRODUCTOS DESDE JSON
  // =======================================
  Future<void> loadProducts() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/dataProduct.json');
      _products = Product.fromJsonList(jsonString);
      notifyListeners();
    } catch (e) {
      print("Error cargando productos: $e");
    }
  }

  // =======================================
  // ✅ MÉTODOS PARA MANEJAR USUARIO
  // =======================================

  void login(String name) {
    _userName = name;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _userName = "Invitado";
    _isLoggedIn = false;
    clearCart();
    notifyListeners();
  }

  // =======================================
  // ✅ MÉTODOS PARA MANEJAR EL CARRITO
  // =======================================

  void addToCart(Product product) {
    _cart.add(product);
    _totalPrice = (_totalPrice + product.precio).clamp(0, double.infinity);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    final index = _cart.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      _totalPrice = (_totalPrice - _cart[index].precio).clamp(0, double.infinity);
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    _totalPrice = 0.0;
    notifyListeners();
  }
}
