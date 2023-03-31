import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:holy_quran_app/data/datasources/quran_remote_data_source.dart';

final locator = GetIt.instance;

void init() {
  // datasources
  locator.registerLazySingleton<QuranRemoteDataSource>(
    () => QuranRemoteDataSourceImpl(
      locator(),
    ),
  );

  // external
  locator.registerLazySingleton<HttpClient>(() => HttpClient());
}
