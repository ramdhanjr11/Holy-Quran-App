part of 'surah_detail_bloc.dart';

abstract class SurahDetailEvent extends Equatable {
  const SurahDetailEvent();

  @override
  List<Object> get props => [];
}

class GetSurahDetailEvent extends SurahDetailEvent {
  final int id;

  const GetSurahDetailEvent({required this.id});
}
