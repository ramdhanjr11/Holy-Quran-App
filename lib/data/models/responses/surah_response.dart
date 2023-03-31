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

  factory SurahResponse.fromMap(Map<String, dynamic> map) {
    return SurahResponse(
      surahList: List<SurahModel>.from(
        (map as List<Map<String, dynamic>>).map<SurahModel>(
          (x) => SurahModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahResponse.fromJson(String source) =>
      SurahResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
