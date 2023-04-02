import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/sholat_time.dart';
import 'package:holy_quran_app/domain/repositories/sholat_time_repository.dart';

class GetSholatTime {
  final SholatTimeRepository repository;

  GetSholatTime({required this.repository});

  Future<Either<Failure, SholatTime>> execute(DateTime date) =>
      repository.getSholatTime(date);
}
