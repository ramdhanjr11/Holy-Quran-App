// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/data/models/surah_model.dart';

class SurahResponse extends Equatable {
  final List<SurahModel> surahList;

  const SurahResponse({required this.surahList});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'surahList': surahList.map((x) => x.toMap()).toList(),
    };
  }

  factory SurahResponse.fromMap(List<dynamic> map) {
    return SurahResponse(
      surahList: List<SurahModel>.from(
        map.map<SurahModel>(
          (x) => SurahModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahResponse.fromJson(String source) =>
      SurahResponse.fromMap(json.decode(source)['data'] as List<dynamic>);

  @override
  List<Object?> get props => [surahList];
}
