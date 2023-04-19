// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/domain/entities/category_article.dart';

class Article extends Equatable {
  final String id;
  final String date;
  final String dateTime;
  final String thumbnail;
  final String author;
  final String authorLink;
  final String title;
  final String url;
  final String type;
  final List<CategoryArticle> categories;

  const Article({
    required this.id,
    required this.date,
    required this.dateTime,
    required this.thumbnail,
    required this.author,
    required this.authorLink,
    required this.title,
    required this.url,
    required this.type,
    required this.categories,
  });

  @override
  List<Object> get props {
    return [
      id,
      date,
      dateTime,
      thumbnail,
      author,
      authorLink,
      title,
      url,
      type,
      categories,
    ];
  }
}
