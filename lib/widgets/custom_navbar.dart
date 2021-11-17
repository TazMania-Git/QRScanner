import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UIProvider>(context);
    final currentIndex = 0;

    return BottomNavigationBar(
      onTap: (int i) => uiprovider.selectedMenuOpt = i,
      elevation: 0,
      currentIndex: uiprovider.selectedMenuOpt,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "Mapa"),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: "Direcciones")
      ],
    );
  }
}
