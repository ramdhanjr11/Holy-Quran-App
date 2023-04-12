import 'dart:async';

import 'package:holy_quran_app/data/models/db/ayah_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper? _instance;

  DbHelper._internal() {
    _instance = this;
  }

  factory DbHelper() => _instance ?? DbHelper._internal();

  static Database? _db;

  Future<Database?> get database async {
    _db ??= await _initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "ayah_db.db");

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static const String _tbAyah = 'tb_ayah';
  static const String _columnIdAyah = 'id';
  static const String _columnSurahAyah = 'surah';
  static const String _columnNumberAyah = 'number';
  static const String _columnArabAyah = 'arab';
  static const String _columnTranslateAyah = 'translate';
  static const String _columnIndonesia = 'indonesia';

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''create table $_tbAyah (
          $_columnIdAyah integer primary key,
          $_columnSurahAyah integer not null,
          $_columnNumberAyah integer not null,
          $_columnArabAyah text not null,
          $_columnTranslateAyah text not null,
          $_columnIndonesia text not null)
      ''');
  }

  Future<int> insertAyah(AyahTable ayah) async {
    var db = await database;
    return await db!.insert(_tbAyah, ayah.toJson());
  }

  Future<int> removeAyah(int id) async {
    var db = await database;
    return await db!.delete(_tbAyah, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<AyahTable>> getAllAyah() async {
    var db = await database;
    var result = await db!.query(_tbAyah);
    return result.map((data) => AyahTable.fromJson(data)).toList();
  }

  Future<List<AyahTable>> getAllAyahBySurahId(int surahId) async {
    var db = await database;
    var result =
        await db!.query(_tbAyah, where: 'surah = ?', whereArgs: [surahId]);
    return result.map((data) => AyahTable.fromJson(data)).toList();
  }
}
