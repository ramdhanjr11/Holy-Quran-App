part of 'ayah_bloc.dart';

abstract class AyahEvent extends Equatable {
  const AyahEvent();

  @override
  List<Object> get props => [];
}

class GetAllSavedAyahEvent extends AyahEvent {}

class GetAllSavedAyahBySurahIdEvent extends AyahEvent {
  final int surahId;

  const GetAllSavedAyahBySurahIdEvent({required this.surahId});
}

class InsertAyahEvent extends AyahEvent {
  final Ayah ayah;

  const InsertAyahEvent({required this.ayah});
}

class RemoveAyahEvent extends AyahEvent {
  final int id;

  const RemoveAyahEvent({required this.id});
}
