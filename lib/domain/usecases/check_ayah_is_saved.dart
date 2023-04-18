import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

import '../entities/ayah.dart';

class CheckAyahIsSaved {
  final QuranRepository repository;

  CheckAyahIsSaved({required this.repository});

  Future<Either<Failure, bool>> execute(Ayah ayah) async {
    return repository.checkAyahIsSaved(ayah);
  }
}
