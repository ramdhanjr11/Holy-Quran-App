import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class RemoveAyah {
  final QuranRepository repository;

  RemoveAyah({required this.repository});

  Future<Either<Failure, int>> execute(int id) async {
    return repository.removeAyah(id);
  }
}
