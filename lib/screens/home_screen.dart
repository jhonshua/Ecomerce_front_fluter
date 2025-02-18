import 'package:flutter/material.dart';// la importación principal de Flutter que proporciona acceso a todos los widgets y herramientas .
import 'package:provider/provider.dart';//para manejar el estado de la aplicación de forma eficiente.
import 'package:tienda/widgets/product_grid_widget.dart';
import 'package:tienda/widgets/user_widget.dart';
import '../models/app_state.dart';//probablemente define una clase llamada AppState, que almacena y maneja el estado global de la aplicación.
import '../widgets/search_widget.dart'; // Importa el widget de búsqueda
import '../widgets/carousel_widget.dart'; // Importa el widget del carrusel
import '../widgets/category_filter_widget.dart'; // Importa el widget de filtros
import '../widgets/countdown_widget.dart'; // Importa el nuevo widget de cuenta regresiva

// Definición de la pantalla principal (HomeScreen)
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Estado de la pantalla principal
class _HomeScreenState extends State<HomeScreen> {

  // Controlador de texto para el campo de búsqueda
  final TextEditingController _searchController = TextEditingController();

  // Función que maneja la búsqueda
  void _onSearch() {
    final query = _searchController.text.trim(); // Obtiene el texto ingresado y elimina espacios en blanco
    if (query.isEmpty) {
      // Muestra un mensaje si el campo está vacío
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa un término de búsqueda.')),
      );
      return;
    }
    print('Buscando: $query'); // Simula una búsqueda imprimiendo el término en la consola
  }

  @override
  void dispose() {
    _searchController.dispose(); // Libera recursos cuando el widget se destruye
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context); // Obtiene el estado de la aplicación

    return Scaffold(
      body: SingleChildScrollView( // Permite desplazamiento si el contenido es largo
        child: Column(
          children: [

            UserWidget(),
            // Widget de búsqueda con el controlador y la función de búsqueda
            SearchWidget(
              searchController: _searchController,
              onSearch: _onSearch,
            ),
            const SizedBox(height: 20), // Espaciado entre elementos
            
            // Carrusel de imágenes
            CarouselWidget(),
            const SizedBox(height: 20),
            
            // Filtros de categorías
            CategoryFilterWidget(),
            const SizedBox(height: 20),
            
            // Cuenta regresiva
            CountdownWidget(),
            const SizedBox(height: 20),

             // Productos grid
            ProductGridWidget(),
          ],
        ),
      ),
    );
  }
}