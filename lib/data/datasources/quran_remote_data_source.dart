import 'dart:convert';

import 'package:holy_quran_app/common/constants.dart';
import 'package:holy_quran_app/common/exceptions.dart';
import 'package:holy_quran_app/data/models/article_model.dart';
import 'package:holy_quran_app/data/models/dua_model.dart';
import 'package:holy_quran_app/data/models/responses/article_list_response.dart';
import 'package:holy_quran_app/data/models/responses/dua_response.dart';
import 'package:holy_quran_app/data/models/responses/surah_detail_response.dart';
import 'package:holy_quran_app/data/models/surah_detail_model.dart';
import 'package:holy_quran_app/data/models/surah_model.dart';
import 'package:holy_quran_app/data/models/responses/surah_response.dart';
import 'package:http/http.dart';

abstract class QuranRemoteDataSource {
  Future<List<SurahModel>> getAllSurah();
  Future<SurahDetailModel> getDetailSurah(int surahId);
  Future<List<ArticleModel>> getArticles();
  Future<List<ArticleModel>> searchArticle(String query);
  Future<List<DuaModel>> getDuahs();
}

class QuranRemoteDataSourceImpl extends QuranRemoteDataSource {
  final Client http;

  QuranRemoteDataSourceImpl(this.http);

  @override
  Future<List<SurahModel>> getAllSurah() async {
    var response = await http.get(Uri.parse(quranBaseUrl));
    var result = response.body;
    if (response.statusCode == 200) {
      return SurahResponse.fromJson(result).surahList;
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

  @override
  Future<List<ArticleModel>> getArticles() async {
    var response = await http.get(Uri.parse(newsBaseUrl));
    var result = response.body;
    if (response.statusCode == 200) {
      return ArticleListResponse.fromJson(json.decode(result)['data']).articles;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ArticleModel>> searchArticle(String query) async {
    var response = await http.get(Uri.parse('$newsBaseUrl?page=1&s=$query'));
    var result = response.body;
    if (response.statusCode == 200) {
      return ArticleListResponse.fromJson(json.decode(result)['data']).articles;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DuaModel>> getDuahs() async {
    var response = await http.get(Uri.parse(duaBaseUrl));
    var result = response.body;
    if (response.statusCode == 200) {
      return DuaResponse.fromJson(json.decode(result)).duaList;
    } else {
      throw ServerException();
    }
  }
}
