part of 'search_surah_bloc.dart';

abstract class SearchSurahState extends Equatable {
  const SearchSurahState();

  @override
  List<Object> get props => [];
}

class SearchSurahInitial extends SearchSurahState {}

class SearchSurahLoading extends SearchSurahState {}

class SearchSurahLoaded extends SearchSurahState {
  final List<Surah> surahList;

  const SearchSurahLoaded({required this.surahList});
}

class SearchSurahError extends SearchSurahState {
  final String message;

  const SearchSurahError({required this.message});
}
