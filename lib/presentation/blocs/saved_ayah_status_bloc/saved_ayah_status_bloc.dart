import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/usecases/get_all_saved_ayah_by_surah_id.dart';
import 'package:holy_quran_app/domain/usecases/insert_ayah.dart';
import 'package:holy_quran_app/domain/usecases/remove_ayah.dart';

part 'saved_ayah_status_event.dart';
part 'saved_ayah_status_state.dart';

class SavedAyahStatusBloc
    extends Bloc<SavedAyahStatusEvent, SavedAyahStatusState> {
  final InsertAyah insertAyah;
  final RemoveAyah removeAyah;
  final GetAllSavedAyahBySurahId getAllSavedAyahBySurahId;

  final List<Ayah> _savedAyahList = [];
  List<Ayah> get savedAyahList => _savedAyahList;

  bool _isAddedToBookmark = false;
  bool get isAddedToBookmark => _isAddedToBookmark;

  SavedAyahStatusBloc({
    required this.insertAyah,
    required this.removeAyah,
    required this.getAllSavedAyahBySurahId,
  }) : super(SavedAyahStatusInitial()) {
    on<GetAllSavedAyahBySurahIdEvent>((event, emit) async {
      emit(SavedAyahLoading());

      var result = await getAllSavedAyahBySurahId.execute(event.surahId);

      result.fold((failure) {
        emit(SavedAyahStatus(message: failure.message, status: false));
      }, (data) {
        _savedAyahList.clear();
        _savedAyahList.addAll(data);
        log(_savedAyahList.length.toString());
      });
    });

    on<GetSavedAyahStatusEvent>((event, emit) async {
      emit(SavedAyahLoading());

      var result = _savedAyahList.contains(event.ayah);

      if (result) {
        _isAddedToBookmark = true;
        emit(const SavedAyahStatus(message: '', status: true));
      } else {
        _isAddedToBookmark = false;
        emit(const SavedAyahStatus(message: '', status: false));
      }
    });

    on<InsertAyahEvent>((event, emit) async {
      emit(SavedAyahLoading());

      var result = await insertAyah.execute(event.ayah);

      result.fold((failure) {
        _isAddedToBookmark = false;
        emit(SavedAyahStatus(message: failure.message, status: false));
      }, (success) {
        _isAddedToBookmark = true;
        emit(const SavedAyahStatus(
            message: 'Success to added ayah', status: true));
        log('sukses');
      });
    });

    on<RemoveAyahEvent>((event, emit) async {
      emit(SavedAyahLoading());

      var result = await removeAyah.execute(event.id);

      result.fold((failure) {
        _isAddedToBookmark = false;
        emit(SavedAyahStatus(message: failure.message, status: false));
      }, (success) {
        _isAddedToBookmark = false;
        emit(const SavedAyahStatus(
            message: 'Success to removed ayah', status: false));
      });
    });
  }
}
