import 'dart:convert';

class Product {
  final String url;
  final String name;
  final String categoria;
  final double precio;
  final List<String> filtros;
  final String? nota;
  final List<String>? color;
  final int puntuacion;

  Product({
    required this.url,
    required this.name,
    required this.categoria,
    required this.precio,
    required this.filtros,
    this.nota,
    this.color,
    required this.puntuacion,
  });

  // 🔹 Convierte un JSON a un objeto Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      url: json["url"],
      name: json["name"],
      categoria: json["categoria"],
      precio: (json["precio"] as num).toDouble(),
      filtros: List<String>.from(json["filtros"]),
      nota: json["nota"] ?? json["note"], // Maneja posibles diferencias de clave
      color: json["color"] != null ? List<String>.from(json["color"]) : null,
      puntuacion: json["puntuacion"],
    );
  }

  // 🔹 Convierte un objeto Product a JSON
  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "name": name,
      "categoria": categoria,
      "precio": precio,
      "filtros": filtros,
      "nota": nota,
      "color": color,
      "puntuacion": puntuacion,
    };
  }

  // 🔹 Convierte una lista de JSON a una lista de productos
  static List<Product> fromJsonList(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    return List<Product>.from(data["data"].map((item) => Product.fromJson(item)));
  }
}
