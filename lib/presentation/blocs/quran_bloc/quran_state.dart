part of 'quran_bloc.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranSurahLoaded extends QuranState {
  final List<Surah> surahList;

  const QuranSurahLoaded({required this.surahList});
}

class QuranDetailSurahLoaded extends QuranState {
  final SurahDetail surahDetail;

  const QuranDetailSurahLoaded({required this.surahDetail});
}

class QuranError extends QuranState {
  final String message;

  const QuranError({required this.message});
}
