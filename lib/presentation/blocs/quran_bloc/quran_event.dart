part of 'quran_bloc.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object> get props => [];
}

class GetAllSurahEvent extends QuranEvent {}

class GetDetailSurahEvent extends QuranEvent {
  final int id;

  const GetDetailSurahEvent({required this.id});
}
