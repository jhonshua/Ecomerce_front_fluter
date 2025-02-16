import 'package:flutter/material.dart';
import '../utils/app_textstyles.dart'; // Importa los estilos de texto

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onSearch;

  const SearchWidget({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Fondo blanco para el contenedor
          borderRadius: BorderRadius.circular(12.0), // Bordes curvos
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Sombra suave
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                style: AppTextStyle.bodyMedium, // Usa el estilo bodyMedium
                decoration: InputDecoration(
                  hintText: 'Buscar productos...',
                  hintStyle: AppTextStyle.bodyMedium.copyWith(
                    color: Colors.grey, // Color del texto de sugerencia
                  ),
                  border: InputBorder.none, // Sin borde predeterminado
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey, // Color del ícono de lupa
                  ),
                ),
              ),
            ),
            const SizedBox(width: 18),
            ElevatedButton(
              onPressed: onSearch,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: const Color(0xFFff5722), // Color naranja
                foregroundColor: Colors.white, // Texto blanco
              ),
              child: Text('Buscar', style: AppTextStyle.buttonMedium),
            ),
          ],
        ),
      ),
    );
  }
}