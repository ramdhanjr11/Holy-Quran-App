// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/sholat_time.dart';

class SholatTimeModel extends Equatable {
  final String tanggal;
  final String imsak;
  final String subuh;
  final String terbit;
  final String dhuha;
  final String dzuhur;
  final String ashar;
  final String maghrib;
  final String isya;
  final String date;

  const SholatTimeModel({
    required this.tanggal,
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    required this.date,
  });

  factory SholatTimeModel.fromJson(Map<String, dynamic> json) =>
      SholatTimeModel(
        tanggal: json['tanggal'],
        imsak: json['imsak'],
        subuh: json['subuh'],
        terbit: json['terbit'],
        dhuha: json['dhuha'],
        dzuhur: json['dzuhur'],
        ashar: json['ashar'],
        maghrib: json['maghrib'],
        isya: json['isya'],
        date: json['date'],
      );

  SholatTime toEntity() => SholatTime(
        tanggal: tanggal,
        imsak: imsak,
        subuh: subuh,
        terbit: terbit,
        dhuha: dhuha,
        dzuhur: dzuhur,
        ashar: ashar,
        maghrib: maghrib,
        isya: isya,
        date: date,
      );

  @override
  List<Object> get props {
    return [
      tanggal,
      imsak,
      subuh,
      terbit,
      dhuha,
      dzuhur,
      ashar,
      maghrib,
      isya,
      date,
    ];
  }
}
