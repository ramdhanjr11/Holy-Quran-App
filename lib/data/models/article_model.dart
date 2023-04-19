// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/data/models/category_article_model.dart';

class ArticleModel extends Equatable {
  final String id;
  final String date;
  final String dateTime;
  final String thumbnail;
  final String author;
  final String authorLink;
  final String title;
  final String url;
  final String type;
  final List<CategoryArticleModel> categories;

  const ArticleModel({
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

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json['id'],
        date: json['date'],
        dateTime: json['date_time'],
        thumbnail: json['thumbnail'],
        author: json['author'],
        authorLink: json['author_link'],
        title: json['title'],
        url: json['url'],
        type: json['type'],
        categories: List.from(json['categories'])
            .map((category) => CategoryArticleModel.fromJson(category))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'date_time': dateTime,
        'thumbnail': thumbnail,
        'author': author,
        'author_link': authorLink,
        'title': title,
        'url': url,
        'type': type,
        'categories': categories
      };

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
