import 'dart:async';
import 'dart:io';

import 'package:me_daily/models/message.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String smsTable = 'sms_table';
  String colId = 'id';
  String colRecipient = 'recipient';
  String colDescription = 'description';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'messages.db';

    // Open/create the database at a given path
    var activityDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return activityDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $smsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colRecipient TEXT, '
            '$colDescription TEXT, $colDate TEXT)');
  }

  // Fetch Operation: Get all todo objects from database
  Future<List<Map<String, dynamic>>> getTodoMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $todoTable order by $colTitle ASC');
    var result = await db.query(smsTable, orderBy: '$colRecipient ASC');
    return result;
  }

  // Insert Operation: Insert a todo object to database
  Future<int> insertTodo(Message message) async {
    Database db = await this.database;
    var result = await db.insert(smsTable, message.toMap());
    return result;
  }

  // Update Operation: Update a todo object and save it to database
  Future<int> updateTodo(Message message) async {
    var db = await this.database;
    var result = await db.update(smsTable, message.toMap(),
        where: '$colId = ?', whereArgs: [message.id]);
    return result;
  }

  Future<int> updateTodoCompleted(Message message) async {
    var db = await this.database;
    var result = await db.update(smsTable, message.toMap(),
        where: '$colId = ?', whereArgs: [message.id]);
    return result;
  }

  // Delete Operation: Delete a todo object from database
  Future<int> deleteTodo(int id) async {
    var db = await this.database;
    int result =
    await db.rawDelete('DELETE FROM $smsTable WHERE $colId = $id');
    return result;
  }

  // Get number of todo objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT (*) from $smsTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
  Future<List<Message>> getTodoList() async {
    var todoMapList = await getTodoMapList(); // Get 'Map List' from database
    int count =
        todoMapList.length; // Count the number of map entries in db table

    List<Message> todoList = List<Message>();
    // For loop to create a 'todo List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      todoList.add(Message.fromMapObject(todoMapList[i]));
    }

    return todoList;
  }
}
