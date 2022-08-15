import 'package:dummy/todo_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const _db = 'todo_db.db'; // our database name
  static const _version =
      1; // version of our db , remember if you have created a db and then want to update this db then update you version too.

//  singleton
  DBHelper._privateConstructor();
  static final DBHelper instance =
      DBHelper._privateConstructor(); // creating a instance

  static Database? _database; //db instance

  Future<Database> get database async {
    // here we are checking if data is initiated or not if not then creating
    if (_database != null) return _database!;

    _database = await _createDB();
    return _database!;
  }

//  create db method
  Future<Database> _createDB() async {
    return openDatabase(
      join(await getDatabasesPath(),
          _db), // using getDatabasePath for path and joining it with db using join method
      onCreate: _onCreate, // on create as name say this will get on oncreate
      version: _version, // passing our version here
    );
  }

//  oncreate
  _onCreate(db, version) {
    db.execute(
      '''
         CREATE TABLE todos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          label TEXT, desc TEXT,
          isComplete INTEGER,
          date TEXT
          )
          ''',
    );
  }

  //  this sql to create table  todos with id as primary key and also autoincrement

//  this method is to insert
  Future<void> insertTodo(TODO todo) async {
    final db = await instance.database; // take db instance

    await db.insert(
      'todos', //table name
      todo.toMap(), //user data model to map,
      conflictAlgorithm:
          ConflictAlgorithm.replace, // you can give different policy here
    );
  }

//  to get all todos
  Future<List<TODO>> todos() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps =
        await db.query('todos'); // to get all data just query table

    return List.generate(maps.length, (i) {
      // here i am creating a list and converting our map list output of query to TODO type of list
      return TODO(
        id: maps[i]['id'],
        date: maps[i]['date'],
        desc: maps[i]['desc'],
        label: maps[i]['label'],
        isComplete: maps[i]['isComplete'],
      );
    });
  }

//  i am not using single data check of filter in this example but this is how you can do
  Future<TODO?> getTodo(int id) async {
    final db = await instance.database;
    //  here i am filtering data with id , you can do whatever you want
    final List<Map<String, dynamic>> maps = await db.query(
      'todos',
      where: 'id = ?', // your field name /column name in terms of table
      whereArgs: [id], // value for that column
    );
// and here i am only returning one value
//  i suggest you to check size before using this , you may get index out of bound error if not data found
    if (maps.isNotEmpty) {
      return TODO(
        id: maps[0]['id'],
        date: maps[0]['date'],
        desc: maps[0]['desc'],
        label: maps[0]['label'],
        isComplete: maps[0]['isComplete'],
      );
    }
    //  return null if nothing found
    return null;
  }

//  this method is to update 
  Future<void> updateTodo(TODO todo) async {
    final db = await instance.database;

    await db.update(
      'todos', //table
      todo.toMap(),// data 
      where: 'id = ?',//column 
      whereArgs: [todo.id],// value for that column , if you don't use any filter here it will update whole table value
    );
  }
// and last if delete pass id of todo to delete 
  Future<void> deleteTodo(int id) async {
    final db = await instance.database;

    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
