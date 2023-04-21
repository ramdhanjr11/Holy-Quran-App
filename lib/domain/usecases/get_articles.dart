import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/article.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class GetArticles {
  final QuranRepository repository;

  GetArticles({required this.repository});

  Future<Either<Failure, List<Article>>> execute() async {
    return repository.getArticles();
  }
}
