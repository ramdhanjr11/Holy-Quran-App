import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/domain/usecases/get_all_surah.dart';

part 'search_surah_event.dart';
part 'search_surah_state.dart';

class SearchSurahBloc extends Bloc<SearchSurahEvent, SearchSurahState> {
  final GetAllSurah getAllSurah;

  SearchSurahBloc({required this.getAllSurah}) : super(SearchSurahInitial()) {
    on<SearchSurahOnQuery>((event, emit) async {
      emit(SearchSurahLoading());

      var result = await getAllSurah.execute();

      result.fold((failure) {
        emit(SearchSurahError(message: failure.message));
      }, (data) {
        if (event.query.isEmpty) {
          emit(SearchSurahInitial());
        } else {
          final filterData = data
              .where(
                (surah) => surah.latinName
                    .toLowerCase()
                    .contains(event.query.toLowerCase()),
              )
              .toList();
          emit(SearchSurahLoaded(surahList: filterData));
        }
      });
    });
  }
}
