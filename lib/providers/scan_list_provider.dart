import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansForType(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos()async{
    final scans = await DBProvider.db.deleteAll();
    this.scans = [];
    notifyListeners();
  }

  borrarPorScanID(int id) async{
    await DBProvider.db.deleteScanId(id);
    this.cargarScanPorTipo(this.tipoSeleccionado);
  }


}
