part of 'surah_bloc.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<Surah> surahList;

  const SurahLoaded({required this.surahList});
}

class SurahError extends SurahState {
  final String message;

  const SurahError({required this.message});
}
