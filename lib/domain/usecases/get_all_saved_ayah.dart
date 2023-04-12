import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class GetAllSavedAyah {
  final QuranRepository repository;

  GetAllSavedAyah({required this.repository});

  Future<Either<Failure, List<Ayah>>> execute() async {
    return repository.getAllSavedAyah();
  }
}
