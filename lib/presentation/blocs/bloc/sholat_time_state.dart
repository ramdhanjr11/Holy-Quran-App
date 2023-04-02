part of 'sholat_time_bloc.dart';

abstract class SholatTimeState extends Equatable {
  const SholatTimeState();

  @override
  List<Object> get props => [];
}

class SholatTimeInitial extends SholatTimeState {}

class SholatTimeLoading extends SholatTimeState {}

class SholatTimeLoaded extends SholatTimeState {
  final SholatTime sholatTime;

  const SholatTimeLoaded({required this.sholatTime});
}

class SholatTimeError extends SholatTimeState {
  final String message;

  const SholatTimeError(this.message);
}
