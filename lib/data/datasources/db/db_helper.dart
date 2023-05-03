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
  static const String _columnAyahId = 'ayahId';
  static const String _columnSurahId = 'surahId';
  static const String _columnArabText = 'arabText';
  static const String _columnLatinText = 'latinText';
  static const String _columnIndonesiaText = 'indonesiaText';
  static const String _columnAudio = 'audio';

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''create table $_tbAyah (
          $_columnAyahId integer not null,
          $_columnSurahId integer not null,
          $_columnArabText text not null,
          $_columnLatinText text not null,
          $_columnIndonesiaText text not null,
          $_columnAudio text not null)
      ''');
  }

  Future<int> insertAyah(AyahTable ayah) async {
    var db = await database;
    var ayahJson = ayah.toJson();
    return await db!.insert(_tbAyah, ayahJson);
  }

  Future<int> removeAyah(int ayahId, int surahId) async {
    var db = await database;
    return await db!.delete(
      _tbAyah,
      where: 'ayahId = ? AND surahId = ?',
      whereArgs: [ayahId, surahId],
    );
  }

  Future<List<AyahTable>> getAllAyah() async {
    var db = await database;
    var result = await db!.query(_tbAyah);
    return result.map((data) => AyahTable.fromJson(data)).toList();
  }

  Future<List<AyahTable>> getAllAyahBySurahId(int surahId) async {
    var db = await database;
    var result =
        await db!.query(_tbAyah, where: 'surahId = ?', whereArgs: [surahId]);
    return result.map((data) => AyahTable.fromJson(data)).toList();
  }
}
