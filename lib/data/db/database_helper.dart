import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/restaurants_list_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblFavorite = 'favorite';

  Future<Database> _initializeDb() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'restarurantapp.db');

    final db = await openDatabase(
      dbPath,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE $_tblFavorite (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            pictureId TEXT,
            city TEXT,
            rating REAL
          )
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    return _database ??= await _initializeDb();
  }

  Future<void> insertFavorite(Restaurant restaurant) async {
    final db = await database;
    await db!.insert(_tblFavorite, restaurant.toJson());
  }

  Future<List<Restaurant>> getFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblFavorite);

    return results.map((item) => Restaurant.fromJson(item)).toList();
  }

  Future<Map> getFavoriteById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;

    await db!.delete(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
