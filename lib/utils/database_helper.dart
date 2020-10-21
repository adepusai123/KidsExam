import 'dart:io';

import 'package:kids_exam/models/questions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'QuestionsData.db';
  static const _databaseVersion = 1;

  // singleton class
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async {
    print(db);
    await db.execute(''' 
      CREATE TABLE ${Question.tblQuestion} (
        ${Question.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Question.colQuestion} TEXT NOT NULL,
        ${Question.colOptions} TEXT NOT NULL, 
        ${Question.colAnswer} TEXT NOT NULL, 
        ${Question.colScore} INTEGER NOT NULL 
      )
    ''');
  }

  Future<int> insertQuestion(Question question) async {
    Database db = await database;
    // return int value
    return await db.insert(Question.tblQuestion, question.toMap());
  }

  Future<List> fetchQuestions() async {
    Database db = await database;
    List<Map> questions = await db.query(Question.tblQuestion);
    return questions.length == 0
        ? []
        : questions.map((e) => Question.fromMap(e)).toList();
  }
}
