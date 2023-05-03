part of 'saved_ayah_status_bloc.dart';

abstract class SavedAyahStatusEvent extends Equatable {
  const SavedAyahStatusEvent();

  @override
  List<Object> get props => [];
}

class GetAllSavedAyahStatusEvent extends SavedAyahStatusEvent {
  final int surahId;

  const GetAllSavedAyahStatusEvent({
    required this.surahId,
  });
}

class InsertAyahEvent extends SavedAyahStatusEvent {
  final Ayah ayah;
  final int surahId;

  const InsertAyahEvent({required this.ayah, required this.surahId});
}

class RemoveAyahEvent extends SavedAyahStatusEvent {
  final int ayahId;
  final int surahId;

  const RemoveAyahEvent({required this.ayahId, required this.surahId});
}
