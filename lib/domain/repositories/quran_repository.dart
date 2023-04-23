import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/article.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<Surah>>> getAllSurah();
  Future<Either<Failure, SurahDetail>> getDetailSurah(int id);
  Future<Either<Failure, List<Ayah>>> getAllSavedAyah();
  Future<Either<Failure, int>> insertAyah(Ayah ayah);
  Future<Either<Failure, int>> removeAyah(int id);
  Future<Either<Failure, List<Ayah>>> getAllSavedAyahBySurahId(int surahId);
  Future<Either<Failure, bool>> checkAyahIsSaved(Ayah ayah);
  Future<Either<Failure, List<Article>>> getArticles();
  Future<Either<Failure, List<Article>>> searchArticle(String query);
}
