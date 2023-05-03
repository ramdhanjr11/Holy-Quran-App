part of 'saved_ayah_status_bloc.dart';

abstract class SavedAyahStatusState extends Equatable {
  const SavedAyahStatusState();

  @override
  List<Object> get props => [];
}

class SavedAyahStatusInitial extends SavedAyahStatusState {}

class SavedAyahStatus extends SavedAyahStatusState {
  final String message;

  const SavedAyahStatus({required this.message});
}

class SavedAyahLoading extends SavedAyahStatusState {}
