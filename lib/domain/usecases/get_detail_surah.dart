import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class GetDetailSurah {
  final QuranRepository repository;

  GetDetailSurah({required this.repository});

  Future<Either<Failure, SurahDetail>> execute(int id) async {
    return repository.getDetailSurah(id);
  }
}
