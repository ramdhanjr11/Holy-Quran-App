import 'package:holy_quran_app/data/datasources/ayah_local_data_source.dart';
import 'package:holy_quran_app/data/datasources/quran_remote_data_source.dart';
import 'package:holy_quran_app/data/models/db/ayah_table.dart';
import 'package:holy_quran_app/domain/entities/article.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource remoteDataSource;
  final AyahLocalDataSource ayahLocalDataSource;

  QuranRepositoryImpl({
    required this.remoteDataSource,
    required this.ayahLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Surah>>> getAllSurah() async {
    try {
      var result = await remoteDataSource.getAllSurah();
      return Right(result.map((surah) => surah.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SurahDetail>> getDetailSurah(int id) async {
    try {
      var result = await remoteDataSource.getDetailSurah(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Ayah>>> getAllSavedAyah() async {
    try {
      var result = await ayahLocalDataSource.getAllAyah();
      return Right(result.map((data) => data.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> insertAyah(Ayah ayah) async {
    try {
      var result =
          await ayahLocalDataSource.insertAyah(AyahTable.fromEntity(ayah));
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> removeAyah(int id) async {
    try {
      var result = await ayahLocalDataSource.removeAyah(id);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Ayah>>> getAllSavedAyahBySurahId(
    int surahId,
  ) async {
    try {
      var result = await ayahLocalDataSource.getAllAyahBySurahId(surahId);
      return Right(result.map((data) => data.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAyahIsSaved(Ayah ayah) async {
    try {
      var savedAyahList =
          await ayahLocalDataSource.getAllAyahBySurahId(ayah.ayahId);
      var isAyahSaved = savedAyahList.contains(AyahTable.fromEntity(ayah));
      if (isAyahSaved) {
        return Right(isAyahSaved);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getArticles() async {
    try {
      var result = await remoteDataSource.getArticles();
      return Right(result.map((data) => data.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> searchArticle(String query) async {
    try {
      var result = await remoteDataSource.searchArticle(query);
      return Right(result.map((data) => data.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
