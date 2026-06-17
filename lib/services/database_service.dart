import 'package:flutter_application_learning/models/expense.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }
  Future<int> insertExpense(
    Expense expense,
  ) async {

    final db = await database;

    return db.insert(
      'expenses',
      expense.toMap(),
    );
  }

  Future<List<Expense>>
  getExpenses() async {

    final db = await database;

    final maps =
        await db.query('expenses');

    return maps.map((map) {

      return Expense.fromMap(map);

    }).toList();
  }

  Future<int> deleteExpense(
    int id,
  ) async {
  
    final db = await database;
  
    return db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  
  Future<Database> initDatabase() async {
    final path = join(
      await getDatabasesPath(),
      'expenses.db',
    );

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE expenses(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            amount REAL,
            category TEXT,
            date TEXT
          )
        ''');
      },
    );
  }
}