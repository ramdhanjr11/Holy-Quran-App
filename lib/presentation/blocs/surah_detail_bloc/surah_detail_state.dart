part of 'surah_detail_bloc.dart';

abstract class SurahDetailState extends Equatable {
  const SurahDetailState();

  @override
  List<Object> get props => [];
}

class SurahDetailInitial extends SurahDetailState {}

class SurahDetailLoading extends SurahDetailState {}

class SurahDetailLoaded extends SurahDetailState {
  final SurahDetail surahDetail;

  const SurahDetailLoaded({required this.surahDetail});
}

class SurahDetailError extends SurahDetailState {
  final String message;

  const SurahDetailError({required this.message});
}
