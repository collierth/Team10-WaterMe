import 'package:sqflite/sqflite.dart';
import 'package:waterme/models/selected_plant.dart';

class DBHelper {
  static Database? _db;

  static final int _version = 1;
  static final String _tableName = "plants";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'plants.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new one");
          return db.execute(
            "CREATE TABLE $_tableName("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "name STRING, staticName STRING, species STRING, description TEXT, "
                "startTime STRING, endTime STRING, waterCycle INTEGER, "
                "isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      print (e);
    }
  }

  static Future<int> insert(SelectedPlant? selectedPlant) async {
    print("insert function called");
    return await _db?.insert(_tableName, selectedPlant!.toJson())??1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(SelectedPlant selectedPlant) async {
    return await _db!.delete(_tableName, where:'id=?', whereArgs: [selectedPlant.id]);
  }

  static update(int id) async {
    return await _db!.rawUpdate('''
      UPDATE plants
      SET isCompleted = ?
      WHERE ID =?
    ''', [1, id]);
  }

  static updateEndTime(String newEndTime, int id) async {
    return await _db!.rawUpdate('''
      UPDATE plants
      SET endTime = ?
      WHERE ID =?
    ''', [newEndTime, id]);
  }

  static updateName(String newName, int id) async {
    return await _db!.rawUpdate('''
      UPDATE plants
      SET name = ?
      WHERE ID =?
    ''', [newName, id]);
  }
}