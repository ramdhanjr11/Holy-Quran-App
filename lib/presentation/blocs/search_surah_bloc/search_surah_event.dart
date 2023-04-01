part of 'search_surah_bloc.dart';

abstract class SearchSurahEvent extends Equatable {
  const SearchSurahEvent();

  @override
  List<Object> get props => [];
}

class SearchSurahOnQuery extends SearchSurahEvent {
  final String query;

  const SearchSurahOnQuery({required this.query});
}
