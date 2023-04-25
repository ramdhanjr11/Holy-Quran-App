import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/dua.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/domain/usecases/get_duas.dart';

part 'dua_event.dart';
part 'dua_state.dart';

class DuaBloc extends Bloc<DuaEvent, DuaState> {
  final GetDuasUseCase _getDuas;

  final List<Dua> _duas = [];
  List<Dua> get duas => _duas;

  DuaBloc(this._getDuas) : super(DuaInitial()) {
    on<GetDuas>((event, emit) async {
      emit(DuaLoading());

      var result = await _getDuas.execute();

      result.fold((failure) {
        emit(DuaError(message: failure.message));
      }, (data) {
        if (_duas.isEmpty) duas.addAll(data);
        emit(DuaLoaded(duas: data));
      });
    });
  }
}
