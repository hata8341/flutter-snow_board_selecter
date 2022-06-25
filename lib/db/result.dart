import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:sbselector/model/result.dart';
import 'package:sqflite/sqflite.dart';

abstract class ResultDb {
  Future<Database> openDb();

  Future<void> create(Result rideType);

  Future<List<Result>> read();

  Future<void> delete(String id);
}

const String resultFileName = 'ride_types.db';
const String resultTableName = 'my_ride_types';

class ResultDbImpl implements ResultDb {
  @override
  Future<Database> openDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), resultFileName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $resultTableName(id TEXT PRIMARY KEY,rideType TEXT,createdAt TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> create(Result result) async {
    try {
      var db = await openDb();
      await db.insert(
        resultTableName,
        result.toMap(),
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
      final List<Map<String, dynamic>> maps = await db.query(resultTableName);
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
        resultTableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } on SocketException {
      throw Exception('No dataBase connection');
    }
  }
}

final resultDbProvider = Provider.autoDispose<ResultDbImpl>((ref) {
  return ResultDbImpl();
});
