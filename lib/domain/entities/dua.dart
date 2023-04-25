// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Dua extends Equatable {
  final String id;
  final String dua;
  final String ayah;
  final String latin;
  final String indonesia;
  bool isExpanded;

  Dua({
    required this.id,
    required this.dua,
    required this.ayah,
    required this.latin,
    required this.indonesia,
    this.isExpanded = false,
  });

  @override
  List<Object> get props {
    return [
      id,
      dua,
      ayah,
      latin,
      indonesia,
    ];
  }
}
