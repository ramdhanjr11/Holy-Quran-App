import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/models/surah.dart';
import 'package:holy_quran_app/domain/models/surah_detail.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<Surah>>> getAllSurah();
  Future<Either<Failure, SurahDetail>> getDetailSurah(int id);
}
