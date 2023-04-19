// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/data/models/article_model.dart';

class ArticleListResponse extends Equatable {
  final List<ArticleModel> articles;

  const ArticleListResponse({required this.articles});

  factory ArticleListResponse.fromJson(Map<String, dynamic> json) =>
      ArticleListResponse(
        articles: List.from(json['data'])
            .map((article) => ArticleModel.fromJson(article))
            .toList(),
      );

  @override
  List<Object> get props => [articles];
}
