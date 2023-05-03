// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/domain/entities/ayah.dart';

class AyahTable extends Equatable {
  final int ayahId;
  final int surahId;
  final String arabText;
  final String latinText;
  final String indonesiaText;
  final String audio;

  const AyahTable({
    required this.ayahId,
    required this.surahId,
    required this.arabText,
    required this.latinText,
    required this.indonesiaText,
    required this.audio,
  });

  factory AyahTable.fromEntity(Ayah entity, int surahId) => AyahTable(
        ayahId: entity.ayahId,
        surahId: surahId,
        arabText: entity.arabText,
        latinText: entity.latinText,
        indonesiaText: entity.indonesiaText,
        audio: entity.audio,
      );

  factory AyahTable.fromJson(Map<String, dynamic> json) => AyahTable(
        ayahId: json['ayahId'],
        surahId: json['surahId'],
        arabText: json['arabText'],
        latinText: json['latinText'],
        indonesiaText: json['indonesiaText'],
        audio: json['audio'],
      );

  Map<String, dynamic> toJson() => {
        'ayahId': ayahId,
        'surahId': surahId,
        'arabText': arabText,
        'latinText': latinText,
        'indonesiaText': indonesiaText,
        'audio': audio,
      };

  Ayah toEntity() => Ayah(
        ayahId: ayahId,
        surahId: surahId,
        arabText: arabText,
        latinText: latinText,
        indonesiaText: indonesiaText,
        audio: audio,
      );

  @override
  List<Object> get props {
    return [
      ayahId,
      surahId,
      arabText,
      latinText,
      indonesiaText,
      audio,
    ];
  }
}
