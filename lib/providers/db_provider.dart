import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
export 'package:qr_scanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScanDB.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      db.execute('''
            CREATE TABLE Scans(
              id INTEGER PRIMARY KEY,
              tipo TEXT,
              valor TEXT
            )
            ''');
    });
  }

//VERSION EN FORMATO RAW
  nuevoScanRaw(ScanModel model) async {
    final id = model.id;
    final tipo = model.tipo;
    final valor = model.valor;

    final db = await database;

    final res = await db!.rawInsert('''
    INSERT INTO Scans(id,tipo,valor)
        VALUES($id,'$tipo','$valor') 
  ''');
    return res;
  }

  Future<int> nuevoScan(ScanModel model) async {
    final db = await database;
    final res = await db!.insert('Scans', model.toJson());
    return res;
  }
}
