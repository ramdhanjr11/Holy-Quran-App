// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/domain/entities/ayah.dart';

class AyahTable extends Equatable {
  final int ayahId;
  final String arabText;
  final String latinText;
  final String indonesiaText;
  final String audio;
  bool isSaved;

  AyahTable({
    required this.ayahId,
    required this.arabText,
    required this.latinText,
    required this.indonesiaText,
    required this.audio,
    this.isSaved = false,
  });

  factory AyahTable.fromEntity(Ayah entity) => AyahTable(
        ayahId: entity.ayahId,
        arabText: entity.arabText,
        latinText: entity.latinText,
        indonesiaText: entity.indonesiaText,
        audio: entity.audio,
        isSaved: entity.isSaved,
      );

  factory AyahTable.fromJson(Map<String, dynamic> json) => AyahTable(
        ayahId: json['nomorAyat'],
        arabText: json['teksArab'],
        latinText: json['teksLatin'],
        indonesiaText: json['teksIndonesia'],
        audio: json['audio'],
        isSaved: json['isSaved'],
      );

  Map<String, dynamic> toJson() => {
        'nomorAyat': ayahId,
        'teksArab': arabText,
        'teksLatin': latinText,
        'teksIndonesia': indonesiaText,
        'audio': audio,
        'isSaved': isSaved,
      };

  Ayah toEntity() => Ayah(
        ayahId: ayahId,
        arabText: arabText,
        latinText: latinText,
        indonesiaText: indonesiaText,
        audio: audio,
        isSaved: isSaved,
      );

  @override
  List<Object> get props {
    return [
      ayahId,
      arabText,
      latinText,
      indonesiaText,
      audio,
      isSaved,
    ];
  }
}
