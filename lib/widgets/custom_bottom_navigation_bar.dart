import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context: context,
            index: 0,
            icon: Icons.list,
          ),
          _buildNavItem(
            context: context,
            index: 1,
            icon: Icons.favorite,
          ),
          _buildHomeButton(context),
          _buildNavItem(
            context: context,
            index: 2,
            icon: Icons.shopping_cart,
          ),
          _buildNavItem(
            context: context,
            index: 3,
            icon: Icons.person,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required IconData icon,
  }) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent, // Color primario solo si está activo
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isActive
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.5), // Icono más suave si no está activo
            ),
          ),
          // const SizedBox(height: 4), // Puedes agregar espacio si lo deseas
        ],
      ),
    );
  }

  Widget _buildHomeButton(BuildContext context) {
    final isHomeActive = currentIndex == 4; // Verifica si Home está activo

    return GestureDetector(
      onTap: () => onTap(4),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isHomeActive
              ? Theme.of(context).colorScheme.primary // Naranja si está activo
              : Theme.of(context).colorScheme.surface, // Color de fondo si no está activo
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          Icons.home,
          color: isHomeActive
              ? Theme.of(context).colorScheme.onPrimary // Blanco si está activo
              : Theme.of(context).colorScheme.primary.withOpacity(0.5), // Naranja suave si no está activo
          size: 30,
        ),
      ),
    );
  }
}