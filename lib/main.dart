import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/home_screen.dart';
import 'package:qr_scanner/pages/mapa_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'mapa': (_) => MapaScreen(),
      },
    );
  }
}
