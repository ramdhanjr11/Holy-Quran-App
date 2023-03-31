// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';

class AyahModel extends Equatable {
  final int id;
  final int surah;
  final int number;
  final String arab;
  final String translate;
  final String indonesia;

  const AyahModel({
    required this.id,
    required this.surah,
    required this.number,
    required this.arab,
    required this.translate,
    required this.indonesia,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'surah': surah,
        'nomor': number,
        'arab': arab,
        'translate': translate,
        'indonesia': indonesia,
      };

  factory AyahModel.fromMap(Map<String, dynamic> map) {
    return AyahModel(
      id: map['id'] as int,
      surah: map['surah'] as int,
      number: map['nomor'] as int,
      arab: map['ar'] as String,
      translate: map['tr'] as String,
      indonesia: map['idn'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AyahModel.fromJson(String source) =>
      AyahModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Ayah toEntity() => Ayah(
        id: id,
        surah: surah,
        number: number,
        arab: arab,
        translate: translate,
        indonesia: indonesia,
      );

  @override
  List<Object?> get props => [id, surah, number, arab, translate, indonesia];
}
