import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDatabase();
    return _database!;
  }

  Future<Database> _initializeDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'decoupage.db');

      print('Database path: $path');

      // Vérifiez si la base existe déjà
      final exists = await File(path).exists();

      if (!exists) {
        print('Database does not exist. Copying from assets...');
        // Copiez la base de données depuis les assets
        ByteData data = await rootBundle.load('packages/decoupage_administratif_senegal/assets/decoupage.db');
        List<int> bytes = data.buffer.asUint8List();
        await File(path).writeAsBytes(bytes);
        print('Database copied to $path');
      }

      // Ouvrir la base de données
      return await openDatabase(path);
    } catch (e) {
      print('Error initializing database: $e');
      rethrow;
    }
  }
}
