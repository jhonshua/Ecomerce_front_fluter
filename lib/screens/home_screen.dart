import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda/widgets/product_grid_widget.dart';
import 'package:tienda/widgets/user_widget.dart';
import '../models/app_state.dart';
import '../widgets/search_widget.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/category_filter_widget.dart';
import '../widgets/countdown_widget.dart';

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
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(161, 248, 190, 132), Color.fromARGB(255, 241, 223, 178)], // Degradado naranja
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50), // Espacio para la barra de estado
              UserWidget(),
              SearchWidget(
                searchController: _searchController,
                onSearch: _onSearch,
              ),
              const SizedBox(height: 20),
              CarouselWidget(),
              const SizedBox(height: 20),
              CategoryFilterWidget(),
              const SizedBox(height: 20),
              CountdownWidget(),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco para contraste
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ProductGridWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
