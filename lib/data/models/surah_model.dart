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
  final String audioFull;

  const SurahModel({
    required this.number,
    required this.name,
    required this.latinName,
    required this.totalAyah,
    required this.type,
    required this.means,
    required this.description,
    required this.audioFull,
  });

  Map<String, dynamic> toMap() => {
        'number': number,
        'name': name,
        'latinName': latinName,
        'totalAyah': totalAyah,
        'type': type,
        'means': means,
        'description': description,
        'audio': audioFull,
      };

  factory SurahModel.fromMap(Map<String, dynamic> map) => SurahModel(
        number: map['nomor'] as int,
        name: map['nama'] as String,
        latinName: map['namaLatin'] as String,
        totalAyah: map['jumlahAyat'] as int,
        type: map['tempatTurun'] as String,
        means: map['arti'] as String,
        description: map['deskripsi'] as String,
        audioFull: map['audioFull']['01'] as String,
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
        audioFull: audioFull,
      );

  @override
  List<Object?> get props =>
      [number, name, latinName, totalAyah, type, means, description, audioFull];
}
