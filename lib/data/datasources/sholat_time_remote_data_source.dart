import 'dart:convert';
import 'dart:developer';

import 'package:holy_quran_app/common/constants.dart';
import 'package:holy_quran_app/common/exceptions.dart';
import 'package:holy_quran_app/data/models/responses/sholat_time_response.dart';
import 'package:holy_quran_app/data/models/sholat_time_model.dart';
import 'package:http/http.dart';

abstract class SholatTimeRemoteDataSource {
  Future<SholatTimeModel> getSholatTime(DateTime date);
}

class SholatTimeRemoteDataSourceImpl implements SholatTimeRemoteDataSource {
  final Client http;

  SholatTimeRemoteDataSourceImpl(this.http);

  @override
  Future<SholatTimeModel> getSholatTime(DateTime date) async {
    final response = await http.get(
      Uri.parse('$sholatTimeBaseUrl/${date.year}/${date.month}/${date.day}'),
    );
    // final responseBody = json.decode(json.encode(response.body));
    final responseBody = json.decode(response.body);

    log(responseBody.toString());
    if (response.statusCode == 200) {
      return SholatTimeResponse.fromJson(responseBody).jadwal;
    } else {
      throw ServerException();
    }
  }
}
