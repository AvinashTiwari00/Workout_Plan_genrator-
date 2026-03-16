import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._internal();
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'college_project.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // users table
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        name TEXT,
        password TEXT,
        age INTEGER,
        height REAL,
        weight REAL,
        goal TEXT,
        experience_level TEXT
      )
    ''');

    // workout_history table
    await db.execute('''
      CREATE TABLE workout_history (
        id INTEGER PRIMARY KEY,
        workout_name TEXT,
        date TEXT
      )
    ''');

    // weight_logs table
    await db.execute('''
      CREATE TABLE weight_logs (
        id INTEGER PRIMARY KEY,
        weight REAL,
        date TEXT
      )
    ''');
  }

  // -------------------- USERS CRUD --------------------

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUser(int id) async {
    final db = await database;
    final res = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (res.isNotEmpty) {
      return res.first;
    }
    return null;
  }

  Future<int> createUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> loginUser(
      String name, String password) async {
    final db = await database;
    final res = await db.query(
      'users',
      where: 'name = ? AND password = ?',
      whereArgs: [name, password],
      limit: 1,
    );
    if (res.isNotEmpty) {
      return res.first;
    }
    return null;
  }

  Future<bool> userExists() async {
    final db = await database;
    final res = await db.rawQuery('SELECT COUNT(*) as count FROM users');
    if (res.isNotEmpty) {
      final count = res.first['count'] as int? ?? 0;
      return count > 0;
    }
    return false;
  }

  // -------------------- WORKOUT HISTORY CRUD --------------------

  Future<int> insertWorkoutHistory(Map<String, dynamic> workout) async {
    final db = await database;
    return await db.insert(
      'workout_history',
      workout,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getWorkoutHistory() async {
    final db = await database;
    return await db.query(
      'workout_history',
      orderBy: 'date DESC',
    );
  }

  // -------------------- WEIGHT LOGS CRUD --------------------

  Future<int> insertWeightLog(Map<String, dynamic> log) async {
    final db = await database;
    return await db.insert(
      'weight_logs',
      log,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getWeightLogs() async {
    final db = await database;
    return await db.query(
      'weight_logs',
      orderBy: 'date DESC',
    );
  }
}

