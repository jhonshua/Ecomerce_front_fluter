import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'product_model.dart';

class AppState with ChangeNotifier {
  // 🔹 Estado del usuario
  String _userName = "Invitado";
  bool _isLoggedIn = false;

  // 🔹 Estado del carrito
  final List<Map<String, dynamic>> _cart = [];
  double _totalPrice = 0.0;

  // 🔹 Estado de los productos
  List<Product> _products = [];

  // 🔹 Getters
  String get userName => _userName;
  bool get isLoggedIn => _isLoggedIn;
  List<Map<String, dynamic>> get cart => List.unmodifiable(_cart);
  double get totalPrice => _totalPrice;
  List<Product> get products => List.unmodifiable(_products);

  // =======================================
  // ✅ CARGAR PRODUCTOS DESDE JSON
  // =======================================
  Future<void> loadProducts() async {
  try {
    final String jsonString = await rootBundle.loadString('assets/dataProduct.json');
    _products = Product.fromJsonList(jsonString); // ✅ Ahora sí existe este método
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

  void addToCart(Product product, String size, String color) {
    _cart.add({
      "product": product,
      "size": size,
      "color": color,
    });
    _totalPrice += product.precio;
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> item) {
    _totalPrice -= item["product"].precio;
    _cart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    _totalPrice = 0.0;
    notifyListeners();
  }
}
