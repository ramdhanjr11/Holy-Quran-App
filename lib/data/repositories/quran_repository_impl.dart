import 'package:holy_quran_app/data/datasources/quran_remote_data_source.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource remoteDataSource;

  QuranRepositoryImpl({required this.remoteDataSource});

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
}
