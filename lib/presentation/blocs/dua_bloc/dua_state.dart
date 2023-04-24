part of 'dua_bloc.dart';

abstract class DuaState extends Equatable {
  const DuaState();

  @override
  List<Object> get props => [];
}

class DuaInitial extends DuaState {}

class DuaLoading extends DuaState {}

class DuaError extends DuaState {
  final String message;

  const DuaError({required this.message});
}

class DuaLoaded extends DuaState {
  final List<Dua> duas;

  const DuaLoaded({required this.duas});
}
