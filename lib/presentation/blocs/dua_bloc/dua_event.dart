part of 'dua_bloc.dart';

abstract class DuaEvent extends Equatable {
  const DuaEvent();

  @override
  List<Object> get props => [];
}

class GetDuas extends DuaEvent {}
