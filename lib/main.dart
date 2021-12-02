import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/home_screen.dart';
import 'package:qr_scanner/pages/mapa_screen.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UIProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new ScanListProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'mapa': (_) => MapaScreen(),
        },
        theme: ThemeData.dark().copyWith(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurpleAccent)),
      ),
    );
  }
}
