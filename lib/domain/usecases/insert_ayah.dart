import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class InsertAyah {
  final QuranRepository repository;

  InsertAyah({required this.repository});

  Future<Either<Failure, int>> execute(Ayah ayah) async {
    return repository.insertAyah(ayah);
  }
}
