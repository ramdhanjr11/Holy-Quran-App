import 'package:get_it/get_it.dart';
import 'package:holy_quran_app/data/datasources/ayah_local_data_source.dart';
import 'package:holy_quran_app/data/datasources/db/db_helper.dart';
import 'package:holy_quran_app/data/datasources/quran_remote_data_source.dart';
import 'package:holy_quran_app/data/datasources/sholat_time_remote_data_source.dart';
import 'package:holy_quran_app/data/repositories/quran_repository_impl.dart';
import 'package:holy_quran_app/data/repositories/sholat_time_repository_impl.dart';
import 'package:holy_quran_app/domain/repositories/quran_repository.dart';
import 'package:holy_quran_app/domain/repositories/sholat_time_repository.dart';
import 'package:holy_quran_app/domain/usecases/check_ayah_is_saved.dart';
import 'package:holy_quran_app/domain/usecases/get_all_saved_ayah.dart';
import 'package:holy_quran_app/domain/usecases/get_all_saved_ayah_by_surah_id.dart';
import 'package:holy_quran_app/domain/usecases/get_all_surah.dart';
import 'package:holy_quran_app/domain/usecases/get_articles.dart';
import 'package:holy_quran_app/domain/usecases/get_detail_surah.dart';
import 'package:holy_quran_app/domain/usecases/get_sholat_time.dart';
import 'package:holy_quran_app/domain/usecases/insert_ayah.dart';
import 'package:holy_quran_app/domain/usecases/remove_ayah.dart';
import 'package:holy_quran_app/presentation/blocs/article_bloc/article_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/ayah_bloc/ayah_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/saved_ayah_status_bloc/saved_ayah_status_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/search_surah_bloc/search_surah_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/sholat_time_bloc/sholat_time_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/surah_bloc/surah_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/surah_detail_bloc/surah_detail_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // datasources
  locator.registerLazySingleton<QuranRemoteDataSource>(
    () => QuranRemoteDataSourceImpl(
      locator(),
    ),
  );

  locator.registerLazySingleton<SholatTimeRemoteDataSource>(
    () => SholatTimeRemoteDataSourceImpl(
      locator(),
    ),
  );

  locator.registerLazySingleton<AyahLocalDataSource>(
    () => AyahLocalDataSourceImpl(
      locator(),
    ),
  );

  // repository
  locator.registerLazySingleton<QuranRepository>(
    () => QuranRepositoryImpl(
      remoteDataSource: locator(),
      ayahLocalDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<SholatTimeRepository>(
    () => SholatTimeRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // usecases
  locator.registerLazySingleton(() => GetAllSurah(repository: locator()));
  locator.registerLazySingleton(() => GetDetailSurah(repository: locator()));
  locator.registerLazySingleton(() => GetSholatTime(repository: locator()));
  locator.registerLazySingleton(() => GetAllSavedAyah(repository: locator()));
  locator.registerLazySingleton(() => InsertAyah(repository: locator()));
  locator.registerLazySingleton(() => RemoveAyah(repository: locator()));
  locator.registerLazySingleton(
      () => GetAllSavedAyahBySurahId(repository: locator()));
  locator.registerLazySingleton(() => CheckAyahIsSaved(repository: locator()));
  locator.registerLazySingleton(() => GetArticles(repository: locator()));

  // blocs
  locator.registerFactory(
    () => SurahBloc(
      getAllSurah: locator(),
    ),
  );

  locator.registerFactory(
    () => SurahDetailBloc(
      getDetailSurah: locator(),
    ),
  );

  locator.registerFactory(
    () => SearchSurahBloc(
      getAllSurah: locator(),
    ),
  );

  locator.registerFactory(
    () => SholatTimeBloc(
      getSholatTime: locator(),
    ),
  );

  locator.registerFactory(
    () => AyahBloc(
      getAllSavedAyah: locator(),
    ),
  );

  locator.registerFactory(
    () => SavedAyahStatusBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => ArticleBloc(
      locator(),
    ),
  );

  // external
  locator.registerLazySingleton<http.Client>(() => http.Client());
  locator.registerLazySingleton<DbHelper>(() => DbHelper());
}
