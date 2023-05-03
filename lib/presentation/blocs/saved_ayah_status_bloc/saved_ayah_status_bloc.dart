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
  final InsertAyah _insertAyah;
  final RemoveAyah _removeAyah;
  final GetAllSavedAyahBySurahId _getAllSavedAyahBySurahId;

  final List<Ayah> _allSavedAyah = [];
  List<Ayah> get allSavedAyah => _allSavedAyah;

  SavedAyahStatusBloc(
    this._insertAyah,
    this._removeAyah,
    this._getAllSavedAyahBySurahId,
  ) : super(SavedAyahStatusInitial()) {
    on<GetAllSavedAyahStatusEvent>((event, emit) async {
      emit(SavedAyahLoading());

      var result = await _getAllSavedAyahBySurahId.execute(event.surahId);

      result.fold((failure) {
        emit(SavedAyahStatus(message: failure.message));
      }, (data) {
        _allSavedAyah.clear();
        _allSavedAyah.addAll(data);
      });
    });

    on<InsertAyahEvent>((event, emit) async {
      emit(SavedAyahLoading());

      var result = await _insertAyah.execute(event.ayah, event.surahId);

      result.fold((failure) {
        emit(SavedAyahStatus(message: failure.message));
      }, (success) {
        emit(const SavedAyahStatus(message: 'Success to added ayah'));
      });
    });

    on<RemoveAyahEvent>((event, emit) async {
      emit(SavedAyahLoading());

      var result = await _removeAyah.execute(event.ayahId, event.surahId);

      result.fold((failure) {
        emit(SavedAyahStatus(message: failure.message));
      }, (success) {
        emit(const SavedAyahStatus(message: 'Success to removed ayah'));
      });
    });
  }
}
