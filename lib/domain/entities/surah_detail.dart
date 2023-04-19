// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/domain/entities/ayah.dart';

class SurahDetail extends Equatable {
  final int number;
  final String name;
  final String latinName;
  final int totalAyah;
  final String type;
  final String means;
  final String description;
  final String audioFull;
  final List<Ayah> surahAyah;

  const SurahDetail({
    required this.number,
    required this.name,
    required this.latinName,
    required this.totalAyah,
    required this.type,
    required this.means,
    required this.description,
    required this.audioFull,
    required this.surahAyah,
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
      audioFull,
      surahAyah,
    ];
  }
}
