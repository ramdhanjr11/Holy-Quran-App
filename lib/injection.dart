import 'package:get_it/get_it.dart';
import 'package:holy_quran_app/data/datasources/quran_remote_data_source.dart';
import 'package:holy_quran_app/data/repositories/quran_repository_impl.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';
import 'package:holy_quran_app/domain/usecases/get_all_surah.dart';
import 'package:holy_quran_app/domain/usecases/get_detail_surah.dart';
import 'package:holy_quran_app/presentation/blocs/quran_bloc/quran_bloc.dart';
import 'package:http/http.dart' as http;

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

  // usecases
  locator.registerLazySingleton(() => GetAllSurah(repository: locator()));
  locator.registerLazySingleton(() => GetDetailSurah(repository: locator()));

  // blocs
  locator.registerFactory(
    () => QuranBloc(
      getAllSurah: locator(),
      getDetailSurah: locator(),
    ),
  );

  // external
  locator.registerLazySingleton<http.Client>(() => http.Client());
}
