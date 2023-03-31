// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';

class SurahModel extends Equatable {
  final int number;
  final String name;
  final String latinName;
  final int totalAyah;
  final String type;
  final String means;
  final String description;
  final String audio;

  const SurahModel({
    required this.number,
    required this.name,
    required this.latinName,
    required this.totalAyah,
    required this.type,
    required this.means,
    required this.description,
    required this.audio,
  });

  Map<String, dynamic> toMap() => {
        'number': number,
        'name': name,
        'latinName': latinName,
        'totalAyah': totalAyah,
        'type': type,
        'means': means,
        'description': description,
        'audio': audio,
      };

  factory SurahModel.fromMap(Map<String, dynamic> map) => SurahModel(
        number: map['nomor'] as int,
        name: map['nama'] as String,
        latinName: map['nama_latin'] as String,
        totalAyah: map['jumlah_ayat'] as int,
        type: map['tempat_turun'] as String,
        means: map['arti'] as String,
        description: map['deskripsi'] as String,
        audio: map['audio'] as String,
      );

  String toJson() => json.encode(toMap());

  factory SurahModel.fromJson(String source) =>
      SurahModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Surah toEntity() => Surah(
        number: number,
        name: name,
        latinName: latinName,
        totalAyah: totalAyah,
        type: type,
        means: means,
        description: description,
        audio: audio,
      );

  @override
  List<Object?> get props =>
      [number, name, latinName, totalAyah, type, means, description, audio];
}
