part of 'saved_ayah_status_bloc.dart';

abstract class SavedAyahStatusEvent extends Equatable {
  const SavedAyahStatusEvent();

  @override
  List<Object> get props => [];
}

class GetAllSavedAyahBySurahIdEvent extends SavedAyahStatusEvent {
  final int surahId;

  const GetAllSavedAyahBySurahIdEvent({required this.surahId});
}

class GetSavedAyahStatusEvent extends SavedAyahStatusEvent {
  final Ayah ayah;

  const GetSavedAyahStatusEvent({required this.ayah});
}

class InsertAyahEvent extends SavedAyahStatusEvent {
  final Ayah ayah;

  const InsertAyahEvent({required this.ayah});
}

class RemoveAyahEvent extends SavedAyahStatusEvent {
  final int id;

  const RemoveAyahEvent({required this.id});
}
