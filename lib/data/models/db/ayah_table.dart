// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';

class AyahTable extends Equatable {
  final int id;
  final int surah;
  final int number;
  final String arab;
  final String translate;
  final String indonesia;

  const AyahTable({
    required this.id,
    required this.surah,
    required this.number,
    required this.arab,
    required this.translate,
    required this.indonesia,
  });

  factory AyahTable.fromEntity(Ayah entity) => AyahTable(
        id: entity.id,
        surah: entity.surah,
        number: entity.number,
        arab: entity.arab,
        translate: entity.translate,
        indonesia: entity.indonesia,
      );

  factory AyahTable.fromJson(Map<String, dynamic> json) => AyahTable(
        id: json['id'],
        surah: json['surah'],
        number: json['number'],
        arab: json['arab'],
        translate: json['translate'],
        indonesia: json['indonesia'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'surah': surah,
        'number': number,
        'arab': arab,
        'translate': translate,
        'indonesia': indonesia,
      };

  Ayah toEntity() => Ayah(
        id: id,
        surah: surah,
        number: number,
        arab: arab,
        translate: translate,
        indonesia: indonesia,
      );

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
