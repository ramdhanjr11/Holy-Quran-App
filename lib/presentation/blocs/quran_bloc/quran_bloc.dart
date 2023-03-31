import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';
import 'package:holy_quran_app/domain/usecases/get_all_surah.dart';
import 'package:holy_quran_app/domain/usecases/get_detail_surah.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final GetAllSurah getAllSurah;
  final GetDetailSurah getDetailSurah;

  QuranBloc({
    required this.getAllSurah,
    required this.getDetailSurah,
  }) : super(QuranInitial()) {
    on<GetAllSurahEvent>((event, emit) async {
      emit(QuranLoading());

      var result = await getAllSurah.execute();

      result.fold((failure) {
        emit(QuranError(message: failure.message));
      }, (data) {
        emit(QuranSurahLoaded(surahList: data));
      });
    });

    on<GetDetailSurahEvent>((event, emit) async {
      emit(QuranLoading());

      var result = await getDetailSurah.execute(event.id);

      result.fold((failure) {
        emit(QuranError(message: failure.message));
      }, (data) {
        emit(QuranDetailSurahLoaded(surahDetail: data));
      });
    });
  }
}
