// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:holy_quran_app/data/models/dua_model.dart';

class DuaResponse extends Equatable {
  final List<DuaModel> duaList;

  const DuaResponse({required this.duaList});

  factory DuaResponse.fromJson(List<dynamic> json) => DuaResponse(
        duaList:
            List.from(json).map((data) => DuaModel.fromJson(data)).toList(),
      );

  @override
  List<Object> get props => [duaList];
}
