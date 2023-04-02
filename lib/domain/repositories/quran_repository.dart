import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<Surah>>> getAllSurah();
  Future<Either<Failure, SurahDetail>> getDetailSurah(int id);
  Future<Either<Failure, List<Ayah>>> getAllAyahSaved();
  Future<Either<Failure, int>> insertAyah(Ayah ayah);
  Future<Either<Failure, int>> removeAyah(int id);
}
