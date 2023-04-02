import 'package:holy_quran_app/data/datasources/sholat_time_remote_data_source.dart';
import 'package:holy_quran_app/domain/entities/sholat_time.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/domain/repositories/sholat_time_repository.dart';

class SholatTimeRepositoryImpl implements SholatTimeRepository {
  final SholatTimeRemoteDataSource remoteDataSource;

  SholatTimeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SholatTime>> getSholatTime(DateTime date) async {
    try {
      final response = await remoteDataSource.getSholatTime(date);
      return Right(response.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
