import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class GetAllSurah {
  final QuranRepository repository;

  GetAllSurah({required this.repository});

  Future<Either<Failure, List<Surah>>> execute() {
    return repository.getAllSurah();
  }
}
