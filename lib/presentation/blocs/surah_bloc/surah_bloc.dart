import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/domain/usecases/get_all_surah.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final GetAllSurah getAllSurah;

  SurahBloc({required this.getAllSurah}) : super(SurahInitial()) {
    on<GetSurahEvent>((event, emit) async {
      emit(SurahLoading());

      var result = await getAllSurah.execute();

      result.fold((failure) {
        emit(SurahError(message: failure.message));
      }, (data) {
        emit(SurahLoaded(surahList: data));
      });
    });
  }
}
