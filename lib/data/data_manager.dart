import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/tree.dart';

class DataManager {
  static const String dbName = 'tree_info.sqlite';
  static const String tableName = 'trees';

  static Future<String> initDb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

    // Check if the database exists
    var exists = false;

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join('assets/sqlite', dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    return path;
  }

  static Future<List<Tree>> getTrees() async {
    final path = await initDb();

    final Database database = await openDatabase(path);

    final List<Map<String, dynamic>> rows = await database.query(tableName);

    final List<Tree> trees = rows.map((row) {
      return Tree(
        id: row['t_id'],
        name: row['t_name'],
        info: row['t_info'],
        icon: row['t_icon'],
        nutritionalValue: row['t_nutritional_value'],
        culinaryUses: row['t_culinary_uses'],
        difficulty: row['t_difficulty'],
        ripetime: row['t_ripetime'],
        bestPlantingTimeZone1: row['t_best_planting_time_zone_1'],
        bestPlantingTimeZone2: row['t_best_planting_time_zone_2'],
        bestPlantingTimeZone3: row['t_best_planting_time_zone_3'],
        humidity: row['t_humidity'],
        temperature: row['t_temperature'],
        sunlight: row['t_sunlight'],
        soil: row['t_soil'],
        water: row['t_water'],
        fertilizer: row['t_fertilizer'],
        tips: row['t_tips'],
      );
    }).toList();

    await database.close();

    return trees;
  }
}
