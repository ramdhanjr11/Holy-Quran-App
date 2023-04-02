import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/sholat_time.dart';

abstract class SholatTimeRepository {
  Future<Either<Failure, SholatTime>> getSholatTime(DateTime date);
}
