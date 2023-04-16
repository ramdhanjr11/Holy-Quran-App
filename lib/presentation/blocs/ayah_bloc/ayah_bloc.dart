import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/usecases/get_all_saved_ayah.dart';

part 'ayah_event.dart';
part 'ayah_state.dart';

class AyahBloc extends Bloc<AyahEvent, AyahState> {
  final GetAllSavedAyah getAllSavedAyah;

  AyahBloc({
    required this.getAllSavedAyah,
  }) : super(AyahInitial()) {
    on<GetAllSavedAyahEvent>((event, emit) async {
      emit(AyahLoading());

      var result = await getAllSavedAyah.execute();

      result.fold((failure) {
        emit(AyahError(failure.message));
      }, (data) {
        emit(AyahLoaded(ayahList: data));
      });
    });
  }
}
