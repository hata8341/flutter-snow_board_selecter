import 'dart:io';

import 'package:path/path.dart';
import 'package:sbselector/db/result.dart';
import 'package:sbselector/model/result.dart';
import 'package:sqflite/sqflite.dart';

const String testResultFileName = 'test_result.db';
const String testResultTableName = 'results';

class FakeResult implements ResultDbImpl {
  @override
  Future<Database> openDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), testResultFileName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $testResultTableName(id TEXT PRIMARY KEY,rideType TEXT,createdAt TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> create(Result rideType) async {
    try {
      var db = await openDb();
      await db.insert(
        testResultTableName,
        rideType.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on SocketException {
      throw Exception('No dataBase connection');
    }
  }

  @override
  Future<List<Result>> read() async {
    try {
      var db = await openDb();
      final List<Map<String, dynamic>> maps = await db.query(testResultTableName);
      return List.generate(maps.length, (index) {
        return Result.fromMap(maps[index]);
      });
    } on SocketException {
      throw Exception('No dataBase connection');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      var db = await openDb();
      await db.delete(
        testResultTableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } on SocketException {
      throw Exception('No dataBase connection');
    }
  }
}
