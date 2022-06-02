import 'package:path/path.dart';
import 'package:sbselector/model/my_ridetype.dart';
import 'package:sqflite/sqflite.dart';

const String rideTypeFileName = 'ride_types.db';
const String rideTypeTableName = 'my_ride_types';

class MyRideTypeDb {
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

  static Future<void> create(MyRideType rideType) async {
    var db = await openDb();
    await db.insert(
      rideTypeTableName,
      rideType.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<MyRideType>> read() async {
    var db = await openDb();
    final List<Map<String, dynamic>> maps = await db.query(rideTypeTableName);
    return List.generate(maps.length, (index) {
      return MyRideType.fromMap(maps[index]);
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
