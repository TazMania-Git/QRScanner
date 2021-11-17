import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: 1,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "Mapa"),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: "Direcciones")
      ],
    );
  }
}
