import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran_app/domain/entities/sholat_time.dart';
import 'package:holy_quran_app/domain/usecases/get_sholat_time.dart';

part 'sholat_time_event.dart';
part 'sholat_time_state.dart';

class SholatTimeBloc extends Bloc<SholatTimeEvent, SholatTimeState> {
  final GetSholatTime getSholatTime;

  SholatTimeBloc({required this.getSholatTime}) : super(SholatTimeInitial()) {
    on<GetSholatTimeEvent>((event, emit) async {
      emit(SholatTimeLoading());

      final result = await getSholatTime.execute(event.date);
      result.fold((failure) {
        emit(SholatTimeError(failure.message));
      }, (data) {
        emit(SholatTimeLoaded(sholatTime: data));
      });
    });
  }
}
