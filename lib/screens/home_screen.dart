import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../utils/app_textstyles.dart'; // Importa los estilos de texto
import '../widgets/search_widget.dart'; // Importa el widget de búsqueda

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearch() {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa un término de búsqueda.')),
      );
      return;
    }
    print('Buscando: $query');
  }

  @override
  void dispose() {
    _searchController.dispose(); // Limpia el controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(
              searchController: _searchController,
              onSearch: _onSearch,
            ),
            const SizedBox(height: 20),
            Text('Usuario: ${appState.userName}', style: AppTextStyle.bodyLarge),
            const SizedBox(height: 20),
            Text('Contador: ${appState.counter}', style: AppTextStyle.bodyMedium),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                appState.setUserName("Juan Pérez");
              },
              child: Text('Cambiar nombre', style: AppTextStyle.buttonMedium),
            ),
            ElevatedButton(
              onPressed: () {
                appState.incrementCounter();
              },
              child: Text('Incrementar contador', style: AppTextStyle.buttonSmall),
            ),
          ],
        ),
      ),
    );
  }
}