import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT,
            isDone INTEGER NOT NULL DEFAULT 0,
            priority TEXT NOT NULL,
            category TEXT NOT NULL,
            dueDate TEXT
          )
          ''',
        );
      },
    );
  }

  Future<int> insertTodo(Todo todo) async {
    final client = await db;
    return client.insert('todos', {
      'title': todo.title,
      'description': todo.description,
      'isDone': todo.isDone.value ? 1 : 0,
      'priority': todo.priority,
      'category': todo.category,
      'dueDate': todo.dueDate?.toIso8601String(),
    });
  }

  Future<List<Todo>> getTodos() async {
    final client = await db;
    final maps = await client.query('todos', orderBy: 'id DESC');
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'] as int,
        title: maps[i]['title'] as String,
        description: maps[i]['description'] as String?,
        isDone: (maps[i]['isDone'] as int) == 1,
        priority: maps[i]['priority'] as String,
        category: maps[i]['category'] as String,
        dueDate: maps[i]['dueDate'] != null ? DateTime.parse(maps[i]['dueDate'] as String) : null,
      );
    });
  }

  Future<int> updateTodo(Todo todo) async {
    final client = await db;
    return client.update('todos', {
      'title': todo.title,
      'description': todo.description,
      'isDone': todo.isDone.value ? 1 : 0,
      'priority': todo.priority,
      'category': todo.category,
      'dueDate': todo.dueDate?.toIso8601String(),
    }, where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> deleteTodo(int id) async {
    final client = await db;
    return client.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
