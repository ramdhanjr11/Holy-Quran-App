// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SholatTime extends Equatable {
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

  const SholatTime({
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
