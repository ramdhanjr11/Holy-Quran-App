// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CategoryArticleModel extends Equatable {
  final String name;
  final String url;

  const CategoryArticleModel({
    required this.name,
    required this.url,
  });

  factory CategoryArticleModel.fromJson(Map<String, dynamic> json) =>
      CategoryArticleModel(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  @override
  List<Object> get props => [name, url];
}
