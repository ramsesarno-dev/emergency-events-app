// ======================================================
// BASE DE DATOS SQLITE
// Nombre: Ramsés Ambiorix Arnó Rosario
// Matrícula: 2024-0078
// ======================================================

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/evento.dart';

class DatabaseHelper {

  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('eventos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
        path,
        version: 1,
        onCreate: _createDB
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE eventos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fecha TEXT,
        titulo TEXT,
        descripcion TEXT,
        foto TEXT
      )
    ''');
  }

  // CREATE
  Future<int> insertarEvento(Evento evento) async {
    final db = await instance.database;
    return await db.insert('eventos', evento.toMap());
  }

  // READ
  Future<List<Evento>> obtenerEventos() async {

    final db = await instance.database;

    final result = await db.query('eventos');

    return result.map((json) => Evento.fromMap(json)).toList();
  }

// DELETE
  Future<int> eliminarEvento(int id) async {
    final db = await instance.database;

    return await db.delete(
      'eventos',
      where: 'id = ?',
      whereArgs: [id]
    );
  }
}