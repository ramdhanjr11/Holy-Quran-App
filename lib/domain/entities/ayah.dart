// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  final int id;
  final int surah;
  final int number;
  final String arab;
  final String translate;
  final String indonesia;

  const Ayah({
    required this.id,
    required this.surah,
    required this.number,
    required this.arab,
    required this.translate,
    required this.indonesia,
  });

  @override
  List<Object> get props {
    return [
      id,
      surah,
      number,
      arab,
      translate,
      indonesia,
    ];
  }
}
