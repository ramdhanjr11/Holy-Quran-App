// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DuaModel extends Equatable {
  final String id;
  final String dua;
  final String ayah;
  final String latin;
  final String indonesia;

  const DuaModel({
    required this.id,
    required this.dua,
    required this.ayah,
    required this.latin,
    required this.indonesia,
  });

  factory DuaModel.fromJson(Map<String, dynamic> json) => DuaModel(
        id: json['id'],
        dua: json['doa'],
        ayah: json['ayat'],
        latin: json['latin'],
        indonesia: json['artinya'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'doa': dua,
        'ayat': ayah,
        'latin': latin,
        'artinya': indonesia,
      };

  @override
  List<Object> get props {
    return [
      id,
      dua,
      ayah,
      latin,
      indonesia,
    ];
  }
}
