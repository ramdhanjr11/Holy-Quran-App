// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int number;
  final String name;
  final String latinName;
  final int totalAyah;
  final String type;
  final String means;
  final String description;
  final String audio;

  const Surah({
    required this.number,
    required this.name,
    required this.latinName,
    required this.totalAyah,
    required this.type,
    required this.means,
    required this.description,
    required this.audio,
  });

  @override
  List<Object> get props {
    return [
      number,
      name,
      latinName,
      totalAyah,
      type,
      means,
      description,
      audio,
    ];
  }
}