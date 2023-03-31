import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:holy_quran_app/data/datasources/quran_remote_data_source.dart';
import 'package:holy_quran_app/data/repositories/quran_repository_impl.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';

final locator = GetIt.instance;

void init() {
  // datasources
  locator.registerLazySingleton<QuranRemoteDataSource>(
    () => QuranRemoteDataSourceImpl(
      locator(),
    ),
  );

  // repository
  locator.registerLazySingleton<QuranRepository>(
    () => QuranRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // external
  locator.registerLazySingleton<HttpClient>(() => HttpClient());
}
