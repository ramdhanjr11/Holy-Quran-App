// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/data/models/sholat_time_model.dart';

class SholatTimeResponse extends Equatable {
  final String status;
  final SholatTimeModel jadwal;

  const SholatTimeResponse({
    required this.status,
    required this.jadwal,
  });

  factory SholatTimeResponse.fromJson(Map<String, dynamic> json) =>
      SholatTimeResponse(
        status: json['status'],
        jadwal: json['data']['jadwal'],
      );

  @override
  List<Object> get props => [status, jadwal];
}
