// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/data/models/ayah_model.dart';

class SurahDetailModel extends Equatable {
  final int number;
  final String name;
  final String latinName;
  final int totalAyah;
  final String type;
  final String means;
  final String description;
  final String audio;
  final List<AyahModel> surahAyah;

  const SurahDetailModel({
    required this.number,
    required this.name,
    required this.latinName,
    required this.totalAyah,
    required this.type,
    required this.means,
    required this.description,
    required this.audio,
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
      'audio': audio,
      'surahAyah': surahAyah.map((x) => x.toMap()).toList(),
    };
  }

  factory SurahDetailModel.fromMap(Map<String, dynamic> map) {
    return SurahDetailModel(
      number: map['number'] as int,
      name: map['name'] as String,
      latinName: map['latinName'] as String,
      totalAyah: map['totalAyah'] as int,
      type: map['type'] as String,
      means: map['means'] as String,
      description: map['description'] as String,
      audio: map['audio'] as String,
      surahAyah: List<AyahModel>.from(
        (map['surahAyah'] as List<int>).map<AyahModel>(
          (x) => AyahModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahDetailModel.fromJson(String source) =>
      SurahDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        number,
        name,
        latinName,
        totalAyah,
        type,
        means,
        description,
        audio,
        surahAyah,
      ];
}
