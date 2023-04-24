import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/dua.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class GetDuasUseCase {
  final QuranRepository repository;

  const GetDuasUseCase({required this.repository});

  Future<Either<Failure, List<Dua>>> execute() async {
    return repository.getDuahs();
  }
}
