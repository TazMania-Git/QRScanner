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
    print(res);
    return res;
  }

  Future<ScanModel> getScanByID(int id) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null!;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db!.query('Scans');
    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<List<ScanModel>> getScansForType(String tipo) async {
    final db = await database;
    final res = await db!.rawQuery('''
    SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');
    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db!.update('Scans', newScan.toJson(),
        where: 'id=?', whereArgs: [newScan.id]);
    return res;
  }

  Future<int> deleteScanId(int id) async {
    final db = await database;
    final res = await db!.delete('Scans',where:'id=?',whereArgs: [id]);
    return res;
  }

Future<int> deleteAll() async {
    final db = await database;
    final res = await db!.delete('Scans');
    return res;
  }



}
