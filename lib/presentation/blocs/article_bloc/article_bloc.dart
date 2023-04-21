import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/domain/entities/article.dart';
import 'package:holy_quran_app/domain/usecases/get_articles.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticles _getArticles;

  ArticleBloc(this._getArticles) : super(ArticleInitial()) {
    on<GetArticlesEvent>((event, emit) async {
      emit(ArticleLoading());

      var result = await _getArticles.execute();

      result.fold((failure) {
        emit(ArticleError(message: failure.message));
      }, (data) {
        emit(ArticleLoaded(articles: data));
      });
    });
  }
}
