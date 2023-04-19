// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CategoryArticle extends Equatable {
  final String name;
  final String url;

  const CategoryArticle({
    required this.name,
    required this.url,
  });

  @override
  List<Object> get props => [name, url];
}
