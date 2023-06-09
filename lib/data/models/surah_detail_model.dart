// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/data/models/ayah_model.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';

class SurahDetailModel extends Equatable {
  final int number;
  final String name;
  final String latinName;
  final int totalAyah;
  final String type;
  final String means;
  final String description;
  final String audioFull;
  final List<AyahModel> surahAyah;

  const SurahDetailModel({
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'name': name,
      'latinName': latinName,
      'totalAyah': totalAyah,
      'type': type,
      'means': means,
      'description': description,
      'audioFull': audioFull,
      'surahAyah': surahAyah.map((x) => x.toMap()).toList(),
    };
  }

  factory SurahDetailModel.fromMap(Map<String, dynamic> map) {
    return SurahDetailModel(
      number: map['nomor'] as int,
      name: map['nama'] as String,
      latinName: map['namaLatin'] as String,
      totalAyah: map['jumlahAyat'] as int,
      type: map['tempatTurun'] as String,
      means: map['arti'] as String,
      description: map['deskripsi'] as String,
      audioFull: map['audioFull']['01'] as String,
      surahAyah: List<AyahModel>.from(
        (map['ayat'] as List).map<AyahModel>(
          (x) => AyahModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahDetailModel.fromJson(String source) =>
      SurahDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  SurahDetail toEntity() => SurahDetail(
        number: number,
        name: name,
        latinName: latinName,
        totalAyah: totalAyah,
        type: type,
        means: means,
        description: description,
        audioFull: audioFull,
        surahAyah: surahAyah.map((ayah) => ayah.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [
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
