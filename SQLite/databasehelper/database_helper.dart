import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  Database? _database;


  Future<Database?> get database async {
    if(_database != null){
      return  _database!;
    }else{
      Directory directory = await getApplicationDocumentsDirectory();
      final path = join(directory.path, "myDatabase.db");
      _database = await  openDatabase(path, version: 1, onCreate: (db, version){
        db.execute(''' CREATE TABLE table_name(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)''');
      });
      return _database;

    }
  }

  Future<void> insert(String name, int age) async {

    final db = await database;
    await db!.insert('table_name',
    {
      'name' : name,
      'age' : age
    });
  }

  Future<List<Map<String, dynamic>>> read() async {
    final db = await database;
    List<Map<String, dynamic>> data =  await db!.query('table_name');

    return List.generate(data.length, (index){
      return data[index];
    });
  }


  Future<void> delete(int id) async {
    final db = await database;
    db!.delete('table_name', where: "id = ?", whereArgs: [id]);
  }

  Future<void> update(int id, String name, int age) async {
    final db = await database;
    final data = {
      'name': name,
      'age': age,
    };
    await db!.update('table_name', data, where: "id = ?", whereArgs: [id]);
  }

}








