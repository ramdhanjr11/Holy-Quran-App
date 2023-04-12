import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/usecases/get_all_saved_ayah.dart';
import 'package:holy_quran_app/domain/usecases/insert_ayah.dart';
import 'package:holy_quran_app/domain/usecases/remove_ayah.dart';

part 'ayah_event.dart';
part 'ayah_state.dart';

class AyahBloc extends Bloc<AyahEvent, AyahState> {
  final GetAllSavedAyah getAllSavedAyah;
  final InsertAyah insertAyah;
  final RemoveAyah removeAyah;

  AyahBloc({
    required this.getAllSavedAyah,
    required this.insertAyah,
    required this.removeAyah,
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

    on<InsertAyahEvent>((event, emit) async {
      emit(AyahLoading());

      var result = await insertAyah.execute(event.ayah);

      result.fold((failure) {
        emit(AyahError(failure.message));
      }, (data) {
        log('insert data status : $data');
      });
    });

    on<RemoveAyahEvent>((event, emit) async {
      var result = await removeAyah.execute(event.id);

      result.fold((failure) {
        emit(AyahError(failure.message));
      }, (data) {
        log('remove data status : $data');
      });
    });
  }
}
