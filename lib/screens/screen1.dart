import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../models/app_state.dart';
import 'screen3.dart'; // Importamos el carrito

class Screen1 extends StatelessWidget {
  final Product product;

  const Screen1({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.url,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: \$${product.precio.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 10),
            Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "Color:",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 5),
    Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: product.color!.map((color) {
        return Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: Color(int.parse(color.replaceFirst('#', '0xFF'))), // Convierte HEX a Color
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black54),
          ),
        );
      }).toList(),
    ),
  ], // 🔹 Este corchete cierra correctamente `children`
), // 🔹 Este paréntesis cierra el `Column`

            Text(
              product.nota.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("${product.name} agregado al carrito")),
                    );
                  },
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text("Agregar al carrito"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Screen3()),
                    );
                  },
                  child: const Text("Ir al carrito"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
