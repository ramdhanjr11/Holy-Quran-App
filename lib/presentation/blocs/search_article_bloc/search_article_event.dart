part of 'search_article_bloc.dart';

abstract class SearchArticleEvent extends Equatable {
  const SearchArticleEvent();

  @override
  List<Object> get props => [];
}

class OnQueryArticle extends SearchArticleEvent {
  final String query;

  const OnQueryArticle({required this.query});
}
