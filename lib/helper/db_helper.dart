import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'todo_list.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            category TEXT,
            startTime TEXT,
            endTime TEXT,
            isDone INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertTodo(TodoModel todo) async {
    final db = await database;
    return await db.insert('todos', {
      'title': todo.title,
      'description': todo.description,
      'category': todo.category,
      'startTime': todo.startTime,
      'endTime': todo.endTime,
      'isDone': todo.isDone ? 1 : 0,
    });
  }

  Future<List<TodoModel>> getTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return TodoModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        category: maps[i]['category'],
        startTime: maps[i]['startTime'],
        endTime: maps[i]['endTime'],
        isDone: maps[i]['isDone'] == 1,
      );
    });
  }

  Future<int> updateTodo(int id, TodoModel todo) async {
    final db = await database;
    return await db.update(
      'todos',
      {
        'title': todo.title,
        'description': todo.description,
        'category': todo.category,
        'startTime': todo.startTime,
        'endTime': todo.endTime,
        'isDone': todo.isDone ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> markAsDone(int id) async {
    final db = await database;
    return await db.update(
      'todos',
      {'isDone': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
