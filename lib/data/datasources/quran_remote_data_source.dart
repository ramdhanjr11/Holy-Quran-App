import 'dart:convert';

import 'package:holy_quran_app/common/constants.dart';
import 'package:holy_quran_app/common/exceptions.dart';
import 'package:holy_quran_app/data/models/responses/surah_detail_response.dart';
import 'package:holy_quran_app/data/models/surah_detail_model.dart';
import 'package:holy_quran_app/data/models/surah_model.dart';
import 'package:holy_quran_app/data/models/responses/surah_response.dart';
import 'package:http/http.dart';

abstract class QuranRemoteDataSource {
  Future<List<SurahModel>> getAllSurah();
  Future<SurahDetailModel> getDetailSurah(int surahId);
}

class QuranRemoteDataSourceImpl extends QuranRemoteDataSource {
  final Client http;

  QuranRemoteDataSourceImpl(this.http);

  @override
  Future<List<SurahModel>> getAllSurah() async {
    var response = await http.get(Uri.parse(quranBaseUrl));
    var result = response.body;
    if (response.statusCode == 200) {
      return SurahResponse.fromJson(json.decode(result)).surahList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SurahDetailModel> getDetailSurah(int surahId) async {
    var response = await http.get(Uri.parse("$quranBaseUrl/$surahId"));
    var result = response.body;
    if (response.statusCode == 200) {
      return SurahDetailResponse.fromJson(result).surahDetailModel;
    } else {
      throw ServerException();
    }
  }
}