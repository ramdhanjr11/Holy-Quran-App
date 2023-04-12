import 'package:holy_quran_app/common/exceptions.dart';
import 'package:holy_quran_app/data/datasources/db/db_helper.dart';
import 'package:holy_quran_app/data/models/db/ayah_table.dart';

abstract class AyahLocalDataSource {
  Future<List<AyahTable>> getAllAyah();
  Future<int> insertAyah(AyahTable ayah);
  Future<int> removeAyah(int id);
  Future<List<AyahTable>> getAllAyahBySurahId(int surahId);
}

class AyahLocalDataSourceImpl implements AyahLocalDataSource {
  final DbHelper db;

  AyahLocalDataSourceImpl(this.db);

  @override
  Future<List<AyahTable>> getAllAyah() async {
    try {
      return db.getAllAyah();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<int> insertAyah(AyahTable ayah) {
    try {
      return db.insertAyah(ayah);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<int> removeAyah(int id) {
    try {
      return db.removeAyah(id);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<AyahTable>> getAllAyahBySurahId(int surahId) {
    try {
      return db.getAllAyahBySurahId(surahId);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
