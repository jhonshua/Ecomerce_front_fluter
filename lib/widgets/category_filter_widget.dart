import 'package:flutter/material.dart';
import '../utils/app_textstyles.dart'; // Importa los estilos de texto

class CategoryFilterWidget extends StatelessWidget {
  const CategoryFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCategoryCircle(Icons.child_care, "Kids"),
          _buildCategoryCircle(Icons.woman, "Woman"),
          _buildCategoryCircle(Icons.man, "Man"),
          _buildCategoryCircle(Icons.local_offer, "Sales"),
        ],
      ),
    );
  }

  // Método para construir cada círculo de categoría
  Widget _buildCategoryCircle(IconData icon, String label) {
    return Column(
      children: [
        // Círculo con icono
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.orange, // Color naranja
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.5), // Sombra naranja
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white, // Icono blanco
            size: 30,
          ),
        ),
        // Etiqueta debajo del círculo
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyle.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}