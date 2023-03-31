import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  String message;

  Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
