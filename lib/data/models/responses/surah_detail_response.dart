// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/data/models/surah_detail_model.dart';

class SurahDetailResponse extends Equatable {
  final SurahDetailModel surahDetailModel;
  
  const SurahDetailResponse({
    required this.surahDetailModel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'surahDetailModel': surahDetailModel.toMap(),
    };
  }

  factory SurahDetailResponse.fromMap(Map<String, dynamic> map) {
    return SurahDetailResponse(
      surahDetailModel: SurahDetailModel.fromMap(
          map['surahDetailModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahDetailResponse.fromJson(String source) =>
      SurahDetailResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [surahDetailModel];
}
