import 'package:dartz/dartz.dart';
import 'package:holy_quran_app/common/failures.dart';
import 'package:holy_quran_app/domain/entities/article.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

class SearchArticleUseCase {
  final QuranRepository repository;

  SearchArticleUseCase({required this.repository});

  Future<Either<Failure, List<Article>>> execute(String query) async {
    return repository.searchArticle(query);
  }
}
