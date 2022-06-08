import 'package:path/path.dart';
import 'package:sbselector/model/result.dart';
import 'package:sqflite/sqflite.dart';

const String rideTypeFileName = 'ride_types.db';
const String rideTypeTableName = 'my_ride_types';

class ResultDb {
  static Future<Database> openDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), rideTypeFileName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $rideTypeTableName(id TEXT PRIMARY KEY,rideType TEXT,createdAt TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> create(Result rideType) async {
    var db = await openDb();
    await db.insert(
      rideTypeTableName,
      rideType.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Result>> read() async {
    var db = await openDb();
    final List<Map<String, dynamic>> maps = await db.query(rideTypeTableName);
    return List.generate(maps.length, (index) {
      return Result.fromMap(maps[index]);
    });
  }

  static Future<void> delete(String id) async {
    var db = await openDb();
    await db.delete(
      rideTypeTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}