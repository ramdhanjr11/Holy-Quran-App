part of 'search_article_bloc.dart';

abstract class SearchArticleState extends Equatable {
  const SearchArticleState();

  @override
  List<Object> get props => [];
}

class SearchArticleInitial extends SearchArticleState {}

class SearchArticleLoading extends SearchArticleState {}

class SearchArticleLoaded extends SearchArticleState {
  final List<Article> articles;

  const SearchArticleLoaded({required this.articles});
}

class SearchArticleError extends SearchArticleState {
  final String message;

  const SearchArticleError({required this.message});
}
