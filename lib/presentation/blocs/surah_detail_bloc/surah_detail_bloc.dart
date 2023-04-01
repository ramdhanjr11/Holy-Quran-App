import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';
import 'package:holy_quran_app/domain/usecases/get_detail_surah.dart';

part 'surah_detail_event.dart';
part 'surah_detail_state.dart';

class SurahDetailBloc extends Bloc<SurahDetailEvent, SurahDetailState> {
  final GetDetailSurah getDetailSurah;

  SurahDetailBloc({required this.getDetailSurah})
      : super(SurahDetailInitial()) {
    on<GetSurahDetailEvent>((event, emit) async {
      emit(SurahDetailLoading());

      var result = await getDetailSurah.execute(event.id);

      result.fold((failure) {
        emit(SurahDetailError(message: failure.message));
      }, (data) {
        emit(SurahDetailLoaded(surahDetail: data));
      });
    });
  }
}
