import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../models/product_model.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final cart = appState.cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: cart.isEmpty
          ? const Center(child: Text("Tu carrito está vacío 😔"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final Product product = cart[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: ListTile(
                          leading: Image.network(
                            product.url,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product.name),
                          subtitle: Text('\$${product.precio.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              appState.removeFromCart(product);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Total: \$${appState.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: cart.isEmpty ? null : () {
                          appState.clearCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Compra realizada con éxito 🎉")),
                          );
                        },
                        child: const Text("Finalizar compra"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
