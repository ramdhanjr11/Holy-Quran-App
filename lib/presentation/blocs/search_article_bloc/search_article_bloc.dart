import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/article.dart';
import 'package:holy_quran_app/domain/usecases/search_article.dart';

part 'search_article_event.dart';
part 'search_article_state.dart';

class SearchArticleBloc extends Bloc<SearchArticleEvent, SearchArticleState> {
  final SearchArticleUseCase _searchArticleUseCase;

  SearchArticleBloc(this._searchArticleUseCase)
      : super(SearchArticleInitial()) {
    on<OnQueryingArticle>((event, emit) async {
      emit(SearchArticleLoading());

      var result = await _searchArticleUseCase.execute(event.query);

      result.fold((failure) {
        emit(SearchArticleError(message: failure.message));
      }, (data) {
        emit(SearchArticleLoaded(articles: data));
      });
    });
  }
}
