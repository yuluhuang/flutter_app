import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_app/models/Schedule.dart';

class ScheduleDB {
  Future<String> get _dbPath async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "schedules.db");

    return path;
  }

  Future<Database> get database async {
    // final path = await _dbPath;
    //
    // Database database = await openDatabase(path, version: 1,
    //     onCreate: (Database db, int version) async {
    //
    //       await db.execute(
    //           "CREATE TABLE schedules (id INTEGER PRIMARY KEY, name TEXT, date TEXT, integral INTEGER, progress INTEGER)");
    //     });
    // return database;

    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    // WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    final Future<Database> database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      // 设置数据库的路径。注意：使用 `path` 包中的 `join` 方法是
      // 确保在多平台上路径都正确的最佳实践。
      join(await getDatabasesPath(), 'schedules.db'),
      // When the database is first created, create a table to store dogs.
      // 当数据库第一次被创建的时候，创建一个数据表，用以存储狗狗们的数据。
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE schedules (id INTEGER PRIMARY KEY, name TEXT, date TEXT, integral INTEGER, progress INTEGER)");
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      // 设置版本。它将执行 onCreate 方法，同时提供数据库升级和降级的路径。
      version: 1,
    );
    return database;
  }

  // Future<int> save(String name) async {
  //   final db = await database;
  //   return db.transaction((trx){
  //     trx.rawInsert( 'INSERT INTO schedule(name) VALUES("$name")');
  //   });
  // }
  // Future<List<Map>> get() async {
  //   final db = await database;
  //   List<Map> list=    await db.rawQuery('SELECT * FROM user');
  //   return list;
  // }

  Future<void> insertSchedule(Schedule schedule) async {
    // Get a reference to the database (获得数据库引用)
    final Database db = await database;
    // 在正确的数据表里插入狗狗的数据。我们也要在这个操作中指定 `conflictAlgorithm` 策略。
    // 如果同样的狗狗数据被多次插入，后一次插入的数据将会覆盖之前的数据。
    await db.insert(
      'schedules',
      schedule.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Schedule>> schedules() async {
    // Get a reference to the database (获得数据库引用)
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('schedules');
    return List.generate(maps.length, (i) {
      return Schedule(
        id: maps[i]['id'],
        name: maps[i]['name'],
        date: maps[i]['date'],
        integral: maps[i]['integral'],
        progress: maps[i]['progress'],
      );
    });
  }

  Future<List<Schedule>> getByDate(date) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT * FROM schedules where date = "$date"');
    return List.generate(maps.length, (i) {
      return Schedule(
        id: maps[i]['id'],
        name: maps[i]['name'],
        date: maps[i]['date'],
        integral: maps[i]['integral'],
        progress: maps[i]['progress'],
      );
    });
  }

  Future<void> updateSchedule(Schedule schedule) async {
    // Get a reference to the database (获得数据库引用)
    final db = await database;
    await db.update(
      'schedules',
      schedule.toMap(),
      where: "id = ?",
      whereArgs: [schedule.id],
    );
  }

  Future<void> deleteSchedule(int id) async {
    // Get a reference to the database (获得数据库引用)
    final db = await database;
    await db.delete(
      'schedules',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    // Get a reference to the database (获得数据库引用)
    final db = await database;
    await db.delete('schedules');
  }
}
