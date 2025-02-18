import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';
import 'screens/screen4.dart';
import 'widgets/custom_bottom_navigation_bar.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 4; // Inicia en Home (índice 4)

  final List<Widget> _screens = [
    Screen2(),
    Screen2(),
    Screen3(),
    Screen4(),
    HomeScreen(), // Home es el índice 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}