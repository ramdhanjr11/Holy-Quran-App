part of 'search_article_bloc.dart';

abstract class SearchArticleEvent extends Equatable {
  const SearchArticleEvent();

  @override
  List<Object> get props => [];
}

class OnQueryingArticle extends SearchArticleEvent {
  final String query;

  const OnQueryingArticle({required this.query});
}
