part of 'sholat_time_bloc.dart';

abstract class SholatTimeEvent extends Equatable {
  const SholatTimeEvent();

  @override
  List<Object> get props => [];
}

class GetSholatTimeEvent extends SholatTimeEvent {
  final DateTime date;

  const GetSholatTimeEvent({required this.date});
}
