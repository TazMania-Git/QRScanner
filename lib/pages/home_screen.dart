import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/direcciones_mapas.dart';
import 'package:qr_scanner/pages/mapa_screen.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/custom_floating_button.dart';
import 'package:qr_scanner/widgets/custom_navbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Historial"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UIProvider>(context);

    final currentIndex = uiprovider.selectedMenuOpt;

    // final tempScan = ScanModel(id: 3, tipo: 'tipo', valor: 'http://google.com');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getAllScans().then((value) => print(value));
    // DBProvider.db.deleteAll().then((value) => print(value));
    // DBProvider.db.deleteScanId(1).then((value) => print(value));

    switch (currentIndex) {
      case 0:
        return MapaScreen();
      case 1:
        return DireccionesScreen();
      default:
        return MapaScreen();
    }
  }
}
