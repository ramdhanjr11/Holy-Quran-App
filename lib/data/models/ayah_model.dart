// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/domain/entities/ayah.dart';

class AyahModel extends Equatable {
  final int ayahId;
  final String arabText;
  final String latinText;
  final String indonesiaText;
  final String audio;

  const AyahModel({
    required this.ayahId,
    required this.arabText,
    required this.latinText,
    required this.indonesiaText,
    required this.audio,
  });

  Ayah toEntity() => Ayah(
        ayahId: ayahId,
        arabText: arabText,
        latinText: latinText,
        indonesiaText: indonesiaText,
        audio: audio,
      );

  @override
  List<Object> get props => [ayahId, arabText, latinText, indonesiaText, audio];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nomorAyat': ayahId,
      'teksArab': arabText,
      'teksLatin': latinText,
      'teksIndonesia': indonesiaText,
      'audio': audio,
    };
  }

  factory AyahModel.fromMap(Map<String, dynamic> map) {
    return AyahModel(
      ayahId: map['nomorAyat'] as int,
      arabText: map['teksArab'] as String,
      latinText: map['teksLatin'] as String,
      indonesiaText: map['teksIndonesia'] as String,
      audio: map['audio']['01'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AyahModel.fromJson(String source) =>
      AyahModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
