part of 'ayah_bloc.dart';

abstract class AyahState extends Equatable {
  const AyahState();

  @override
  List<Object> get props => [];
}

class AyahInitial extends AyahState {}

class AyahLoading extends AyahState {}

class AyahLoaded extends AyahState {
  final List<Ayah> ayahList;

  const AyahLoaded({required this.ayahList});
}

class AyahError extends AyahState {
  final String message;

  const AyahError(this.message);
}
