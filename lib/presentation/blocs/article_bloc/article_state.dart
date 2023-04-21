part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;

  const ArticleLoaded({required this.articles});
}

class ArticleError extends ArticleState {
  final String message;

  const ArticleError({required this.message});
}
